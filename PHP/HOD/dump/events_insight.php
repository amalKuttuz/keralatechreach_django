<?php
// event_insights.php

session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}

// Initialize error arrays
$errors = [];
$warnings = [];
$success_messages = [];

// Database connection with error handling
try {
    include('conn.php');
} catch (Exception $e) {
    $errors[] = "Database connection failed: " . $e->getMessage();
}

include('head.php');

// Set default filters
$filter_date_start = isset($_GET['date_start']) ? $_GET['date_start'] : date('Y-m-d', strtotime('-30 days'));
$filter_date_end = isset($_GET['date_end']) ? $_GET['date_end'] : date('Y-m-d');
$filter_district = isset($_GET['district_id']) ? (int)$_GET['district_id'] : 0;
$filter_category = isset($_GET['category_id']) ? (int)$_GET['category_id'] : 0;
$filter_event = isset($_GET['event_id']) ? (int)$_GET['event_id'] : 0;

// Fetch districts for filtering
$districts = [];
$districts_query = $conn->query("SELECT * FROM districts ORDER BY district");
if ($districts_query) {
    while ($row = $districts_query->fetch_assoc()) {
        $districts[] = $row;
    }
    $districts_query->close();
}

// Fetch categories for filtering
$categories = [];
$categories_query = $conn->query("SELECT * FROM event_category ORDER BY category");
if ($categories_query) {
    while ($row = $categories_query->fetch_assoc()) {
        $categories[] = $row;
    }
    $categories_query->close();
}

// Fetch events for filtering
$events = [];
$events_query = $conn->query("SELECT id, name FROM events ORDER BY name");
if ($events_query) {
    while ($row = $events_query->fetch_assoc()) {
        $events[] = $row;
    }
    $events_query->close();
}

// Build WHERE clause for filtering
$where_clause = "WHERE 1=1";
$params = [];
$param_types = "";

if ($filter_date_start && $filter_date_end) {
    $where_clause .= " AND (ei.timestamp BETWEEN ? AND ? OR ein.timestamp BETWEEN ? AND ?)";
    $params[] = $filter_date_start . " 00:00:00";
    $params[] = $filter_date_end . " 23:59:59";
    $params[] = $filter_date_start . " 00:00:00";
    $params[] = $filter_date_end . " 23:59:59";
    $param_types .= "ssss";
}

if ($filter_district > 0) {
    $where_clause .= " AND e.district_id = ?";
    $params[] = $filter_district;
    $param_types .= "i";
}

if ($filter_category > 0) {
    $where_clause .= " AND e.category_id = ?";
    $params[] = $filter_category;
    $param_types .= "i";
}

if ($filter_event > 0) {
    $where_clause .= " AND e.id = ?";
    $params[] = $filter_event;
    $param_types .= "i";
}

// INSIGHT 1: Overall event performance metrics
$overall_metrics = [
    'total_impressions' => 0,
    'total_interactions' => 0,
    'unique_viewers' => 0,
    'interaction_rate' => 0,
    'most_popular_event' => 'N/A',
    'most_popular_event_id' => 0,
    'most_popular_event_impressions' => 0
];

// Get total impressions and unique viewers
$impressions_sql = "
    SELECT 
        COUNT(*) as total_impressions,
        COUNT(DISTINCT ei.user_id) as unique_viewers
    FROM 
        event_impressions ei
    JOIN 
        events e ON ei.event_id = e.id
    $where_clause
";

$stmt_impressions = $conn->prepare($impressions_sql);
if ($param_types) {
    $stmt_impressions->bind_param($param_types, ...$params);
}
$stmt_impressions->execute();
$result_impressions = $stmt_impressions->get_result();
if ($row = $result_impressions->fetch_assoc()) {
    $overall_metrics['total_impressions'] = $row['total_impressions'];
    $overall_metrics['unique_viewers'] = $row['unique_viewers'];
}
$stmt_impressions->close();

// Get total interactions
$interactions_sql = "
    SELECT 
        COUNT(*) as total_interactions
    FROM 
        event_interactions ein
    JOIN 
        events e ON ein.event_id = e.id
    $where_clause
";

$stmt_interactions = $conn->prepare($interactions_sql);
if ($param_types) {
    $stmt_interactions->bind_param($param_types, ...$params);
}
$stmt_interactions->execute();
$result_interactions = $stmt_interactions->get_result();
if ($row = $result_interactions->fetch_assoc()) {
    $overall_metrics['total_interactions'] = $row['total_interactions'];
}
$stmt_interactions->close();

// Calculate interaction rate
if ($overall_metrics['total_impressions'] > 0) {
    $overall_metrics['interaction_rate'] = round(($overall_metrics['total_interactions'] / $overall_metrics['total_impressions']) * 100, 2);
}

// Get most popular event by impressions
$popular_event_sql = "
    SELECT 
        e.id,
        e.name,
        COUNT(ei.id) as impression_count
    FROM 
        events e
    LEFT JOIN 
        event_impressions ei ON e.id = ei.event_id
    $where_clause
    GROUP BY 
        e.id, e.name
    ORDER BY 
        impression_count DESC
    LIMIT 1
";

$stmt_popular = $conn->prepare($popular_event_sql);
if ($param_types) {
    $stmt_popular->bind_param($param_types, ...$params);
}
$stmt_popular->execute();
$result_popular = $stmt_popular->get_result();
if ($row = $result_popular->fetch_assoc()) {
    $overall_metrics['most_popular_event'] = $row['name'];
    $overall_metrics['most_popular_event_id'] = $row['id'];
    $overall_metrics['most_popular_event_impressions'] = $row['impression_count'];
}
$stmt_popular->close();

// INSIGHT 2: Events by impression count
$events_by_impressions_sql = "
    SELECT 
        e.id,
        e.name,
        COUNT(ei.id) as impression_count,
        COUNT(DISTINCT ei.user_id) as unique_viewers
    FROM 
        events e
    LEFT JOIN 
        event_impressions ei ON e.id = ei.event_id
    $where_clause
    GROUP BY 
        e.id, e.name
    ORDER BY 
        impression_count DESC
    LIMIT 10
";

$events_by_impressions = [];
$stmt_events_impressions = $conn->prepare($events_by_impressions_sql);
if ($param_types) {
    $stmt_events_impressions->bind_param($param_types, ...$params);
}
$stmt_events_impressions->execute();
$result_events_impressions = $stmt_events_impressions->get_result();
while ($row = $result_events_impressions->fetch_assoc()) {
    $events_by_impressions[] = $row;
}
$stmt_events_impressions->close();

// INSIGHT 3: Events by interaction count
$events_by_interactions_sql = "
    SELECT 
        e.id,
        e.name,
        COUNT(ein.id) as interaction_count,
        COUNT(DISTINCT ein.user_id) as unique_users
    FROM 
        events e
    LEFT JOIN 
        event_interactions ein ON e.id = ein.event_id
    $where_clause
    GROUP BY 
        e.id, e.name
    ORDER BY 
        interaction_count DESC
    LIMIT 10
";

$events_by_interactions = [];
$stmt_events_interactions = $conn->prepare($events_by_interactions_sql);
if ($param_types) {
    $stmt_events_interactions->bind_param($param_types, ...$params);
}
$stmt_events_interactions->execute();
$result_events_interactions = $stmt_events_interactions->get_result();
while ($row = $result_events_interactions->fetch_assoc()) {
    $events_by_interactions[] = $row;
}
$stmt_events_interactions->close();

// INSIGHT 4: Interaction types breakdown
$interaction_types_sql = "
    SELECT 
        ein.interaction_type,
        COUNT(*) as count
    FROM 
        event_interactions ein
    JOIN 
        events e ON ein.event_id = e.id
    $where_clause
    GROUP BY 
        ein.interaction_type
    ORDER BY 
        count DESC
";

$interaction_types = [];
$stmt_interaction_types = $conn->prepare($interaction_types_sql);
if ($param_types) {
    $stmt_interaction_types->bind_param($param_types, ...$params);
}
$stmt_interaction_types->execute();
$result_interaction_types = $stmt_interaction_types->get_result();
while ($row = $result_interaction_types->fetch_assoc()) {
    $interaction_types[] = $row;
}
$stmt_interaction_types->close();

// INSIGHT 5: Impressions source breakdown
$impressions_source_sql = "
    SELECT 
        ei.source,
        COUNT(*) as count
    FROM 
        event_impressions ei
    JOIN 
        events e ON ei.event_id = e.id
    $where_clause
    GROUP BY 
        ei.source
    ORDER BY 
        count DESC
";

$impressions_source = [];
$stmt_impressions_source = $conn->prepare($impressions_source_sql);
if ($param_types) {
    $stmt_impressions_source->bind_param($param_types, ...$params);
}
$stmt_impressions_source->execute();
$result_impressions_source = $stmt_impressions_source->get_result();
while ($row = $result_impressions_source->fetch_assoc()) {
    $impressions_source[] = $row;
}
$stmt_impressions_source->close();

// INSIGHT 6: Daily trends for impressions and interactions
$daily_trends_sql = "
    SELECT 
        DATE(COALESCE(ei.timestamp, ein.timestamp)) as date,
        COUNT(DISTINCT ei.id) as impressions,
        COUNT(DISTINCT ein.id) as interactions
    FROM 
        events e
    LEFT JOIN 
        event_impressions ei ON e.id = ei.event_id
    LEFT JOIN 
        event_interactions ein ON e.id = ein.event_id
    $where_clause
    GROUP BY 
        date
    ORDER BY 
        date ASC
";

$daily_trends = [];
$stmt_daily_trends = $conn->prepare($daily_trends_sql);
if ($param_types) {
    $stmt_daily_trends->bind_param($param_types, ...$params);
}
$stmt_daily_trends->execute();
$result_daily_trends = $stmt_daily_trends->get_result();
while ($row = $result_daily_trends->fetch_assoc()) {
    $daily_trends[] = $row;
}
$stmt_daily_trends->close();

// INSIGHT 7: Calculate engagement score for each event
$engagement_scores_sql = "
    SELECT 
        e.id,
        e.name,
        COUNT(DISTINCT ei.id) as impressions,
        COUNT(DISTINCT ein.id) as interactions,
        COUNT(DISTINCT ein.id) / NULLIF(COUNT(DISTINCT ei.id), 0) * 100 as engagement_score
    FROM 
        events e
    LEFT JOIN 
        event_impressions ei ON e.id = ei.event_id
    LEFT JOIN 
        event_interactions ein ON e.id = ein.event_id
    $where_clause
    GROUP BY 
        e.id, e.name
    HAVING 
        impressions > 0
    ORDER BY 
        engagement_score DESC
    LIMIT 10
";

$engagement_scores = [];
$stmt_engagement = $conn->prepare($engagement_scores_sql);
if ($param_types) {
    $stmt_engagement->bind_param($param_types, ...$params);
}
$stmt_engagement->execute();
$result_engagement = $stmt_engagement->get_result();
while ($row = $result_engagement->fetch_assoc()) {
    $engagement_scores[] = $row;
}
$stmt_engagement->close();

// INSIGHT 8: Trending events (events with rapid growth in impressions)
$trending_events_sql = "
    SELECT 
        e.id,
        e.name,
        COUNT(CASE WHEN ei.timestamp BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW() THEN 1 ELSE NULL END) as recent_impressions,
        COUNT(CASE WHEN ei.timestamp BETWEEN DATE_SUB(NOW(), INTERVAL 14 DAY) AND DATE_SUB(NOW(), INTERVAL 7 DAY) THEN 1 ELSE NULL END) as previous_impressions,
        (COUNT(CASE WHEN ei.timestamp BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW() THEN 1 ELSE NULL END) - 
         COUNT(CASE WHEN ei.timestamp BETWEEN DATE_SUB(NOW(), INTERVAL 14 DAY) AND DATE_SUB(NOW(), INTERVAL 7 DAY) THEN 1 ELSE NULL END)) as growth
    FROM 
        events e
    LEFT JOIN 
        event_impressions ei ON e.id = ei.event_id
    $where_clause
    GROUP BY 
        e.id, e.name
    HAVING 
        previous_impressions > 0
    ORDER BY 
        growth DESC
    LIMIT 5
";

$trending_events = [];
$stmt_trending = $conn->prepare($trending_events_sql);
if ($param_types) {
    $stmt_trending->bind_param($param_types, ...$params);
}
$stmt_trending->execute();
$result_trending = $stmt_trending->get_result();
while ($row = $result_trending->fetch_assoc()) {
    $trending_events[] = $row;
}
$stmt_trending->close();

// INSIGHT 9: User retention - return visitors
$user_retention_sql = "
    SELECT
        COUNT(DISTINCT user_id) as total_users,
        COUNT(DISTINCT CASE WHEN visit_count > 1 THEN user_id END) as returning_users,
        (COUNT(DISTINCT CASE WHEN visit_count > 1 THEN user_id END) / COUNT(DISTINCT user_id)) * 100 as retention_rate
    FROM (
        SELECT 
            ei.user_id,
            COUNT(DISTINCT DATE(ei.timestamp)) as visit_count
        FROM 
            event_impressions ei
        JOIN 
            events e ON ei.event_id = e.id
        $where_clause
        GROUP BY 
            ei.user_id
    ) as user_visits
";

$user_retention = [
    'total_users' => 0,
    'returning_users' => 0,
    'retention_rate' => 0
];

$stmt_retention = $conn->prepare($user_retention_sql);
if ($param_types) {
    $stmt_retention->bind_param($param_types, ...$params);
}
$stmt_retention->execute();
$result_retention = $stmt_retention->get_result();
if ($row = $result_retention->fetch_assoc()) {
    $user_retention = $row;
}
$stmt_retention->close();

// INSIGHT 10: Sponsored vs non-sponsored events performance
$sponsored_comparison_sql = "
    SELECT 
        e.is_sponsored,
        COUNT(DISTINCT e.id) as event_count,
        COUNT(ei.id) as total_impressions,
        COUNT(ein.id) as total_interactions,
        COUNT(ein.id) / NULLIF(COUNT(ei.id), 0) * 100 as engagement_rate
    FROM 
        events e
    LEFT JOIN 
        event_impressions ei ON e.id = ei.event_id
    LEFT JOIN 
        event_interactions ein ON e.id = ein.event_id
    $where_clause
    GROUP BY 
        e.is_sponsored
";

$sponsored_comparison = [];
$stmt_sponsored = $conn->prepare($sponsored_comparison_sql);
if ($param_types) {
    $stmt_sponsored->bind_param($param_types, ...$params);
}
$stmt_sponsored->execute();
$result_sponsored = $stmt_sponsored->get_result();
while ($row = $result_sponsored->fetch_assoc()) {
    $sponsored_comparison[] = $row;
}
$stmt_sponsored->close();

// INSIGHT 11: Time-of-day analysis
$time_of_day_sql = "
    SELECT 
        HOUR(ei.timestamp) as hour_of_day,
        COUNT(*) as impression_count
    FROM 
        event_impressions ei
    JOIN 
        events e ON ei.event_id = e.id
    $where_clause
    GROUP BY 
        hour_of_day
    ORDER BY 
        hour_of_day ASC
";

$time_of_day = [];
$stmt_time = $conn->prepare($time_of_day_sql);
if ($param_types) {
    $stmt_time->bind_param($param_types, ...$params);
}
$stmt_time->execute();
$result_time = $stmt_time->get_result();
while ($row = $result_time->fetch_assoc()) {
    $time_of_day[] = $row;
}
$stmt_time->close();

// Close database connection
$conn->close();

// Prepare data for charts
$daily_chart_data = [];
foreach ($daily_trends as $trend) {
    $daily_chart_data[] = [
        'date' => date('M d', strtotime($trend['date'])),
        'impressions' => (int)$trend['impressions'],
        'interactions' => (int)$trend['interactions']
    ];
}

$interaction_types_chart_data = [];
foreach ($interaction_types as $type) {
    $interaction_types_chart_data[] = [
        'type' => $type['interaction_type'],
        'count' => (int)$type['count']
    ];
}

$impressions_source_chart_data = [];
foreach ($impressions_source as $source) {
    $impressions_source_chart_data[] = [
        'source' => $source['source'],
        'count' => (int)$source['count']
    ];
}

$time_of_day_chart_data = [];
for ($i = 0; $i < 24; $i++) {
    $found = false;
    foreach ($time_of_day as $hour_data) {
        if ((int)$hour_data['hour_of_day'] === $i) {
            $time_of_day_chart_data[] = [
                'hour' => $i,
                'label' => sprintf('%02d:00', $i),
                'count' => (int)$hour_data['impression_count']
            ];
            $found = true;
            break;
        }
    }
    if (!$found) {
        $time_of_day_chart_data[] = [
            'hour' => $i,
            'label' => sprintf('%02d:00', $i),
            'count' => 0
        ];
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Insights Dashboard</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    
    <!-- DataTables -->
    <link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <style>
        .chart-container {
            position: relative;
            height: 300px;
            margin-bottom: 20px;
        }
        .dashboard-stat {
            text-align: center;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            color: #fff;
        }
        .dashboard-stat h2 {
            font-size: 2.5em;
            margin: 0;
            font-weight: 700;
        }
        .dashboard-stat p {
            margin: 5px 0 0;
            font-size: 1.1em;
            opacity: 0.8;
        }
        .stat-impressions { background-color: #3498db; }
        .stat-interactions { background-color: #2ecc71; }
        .stat-viewers { background-color: #9b59b6; }
        .stat-rate { background-color: #e67e22; }
        .trending-event {
            border-left: 4px solid #f39c12;
            padding-left: 15px;
            margin-bottom: 15px;
        }
        .trending-event h4 {
            margin-top: 0;
            color: #333;
        }
        .trending-event .growth {
            color: #27ae60;
            font-weight: bold;
        }
        .trending-event .negative-growth {
            color: #e74c3c;
            font-weight: bold;
        }
        .alert-container {
            margin-bottom: 20px;
        }
        .alert {
            padding: 15px;
            margin-bottom: 10px;
            border: 1px solid transparent;
            border-radius: 4px;
        }
        .alert-danger {
            color: #721c24;
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }
        .alert-warning {
            color: #856404;
            background-color: #fff3cd;
            border-color: #ffeeba;
        }
        .alert-success {
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
        }
        .alert-dismissible {
            padding-right: 40px;
        }
        .alert-dismissible .close {
            position: absolute;
            top: 0;
            right: 0;
            padding: 15px;
            color: inherit;
        }
    </style>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- DataTables -->
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
    
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <!-- Moment.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>

      

        <section id="main-content">
            <section class="wrapper">
                <!-- Add this right after wrapper section starts -->
                <div class="alert-container">
                    <?php if (!empty($errors)): ?>
                        <?php foreach ($errors as $error): ?>
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <strong><i class="fas fa-exclamation-circle"></i> Error!</strong> <?php echo htmlspecialchars($error); ?>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        <?php endforeach; ?>
                    <?php endif; ?>

                    <?php if (!empty($warnings)): ?>
                        <?php foreach ($warnings as $warning): ?>
                            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                <strong><i class="fas fa-exclamation-triangle"></i> Warning!</strong> <?php echo htmlspecialchars($warning); ?>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        <?php endforeach; ?>
                    <?php endif; ?>

                    <?php if (!empty($success_messages)): ?>
                        <?php foreach ($success_messages as $message): ?>
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <strong><i class="fas fa-check-circle"></i> Success!</strong> <?php echo htmlspecialchars($message); ?>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Event Insights Dashboard</h1>
                        <ol class="breadcrumb">
                            <li><a href="index.php">Home</a></li>
                            <li><a href="events.php">Events</a></li>
                            <li class="active">Event Insights</li>
                        </ol>
                    </div>
                </div>

                <!-- Filter Panel -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-filter"></i> Filter Insights</h3>
                            </div>
                            <div class="panel-body">
                                <form class="form-horizontal" method="GET">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Date Range (Start)</label>
                                                <input type="date" class="form-control" name="date_start" value="<?php echo $filter_date_start; ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Date Range (End)</label>
                                                <input type="date" class="form-control" name="date_end" value="<?php echo $filter_date_end; ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>District</label>
                                                <select class="form-control" name="district_id">
                                                    <option value="0">All Districts</option>
                                                    <?php foreach ($districts as $district) : ?>
                                                        <option value="<?php echo $district['district_id']; ?>" <?php echo ($filter_district == $district['district_id']) ? 'selected' : ''; ?>>
                                                            <?php echo htmlspecialchars($district['district']); ?>
                                                        </option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Category</label>
                                                <select class="form-control" name="category_id">
                                                    <option value="0">All Categories</option>
                                                    <?php foreach ($categories as $category) : ?>
                                                        <option value="<?php echo $category['category_id']; ?>" <?php echo ($filter_category == $category['category_id']) ? 'selected' : ''; ?>>
                                                            <?php echo htmlspecialchars($category['category']); ?>
                                                        </option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Event</label>
                                                <select class="form-control" name="event_id">
                                                    <option value="0">All Events</option>
                                                    <?php foreach ($events as $event) : ?>
                                                        <option value="<?php echo $event['id']; ?>" <?php echo ($filter_event == $event['id']) ? 'selected' : ''; ?>>
                                                            <?php echo htmlspecialchars($event['name']); ?>
                                                        </option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> Apply Filters</button>
                                            <a href="event_insights.php" class="btn btn-default"><i class="fa fa-refresh"></i> Reset Filters</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Key Metrics Cards -->
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="dashboard-stat stat-impressions">
                            <h2><?php echo number_format($overall_metrics['total_impressions']); ?></h2>
                            <p>Total Impressions</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="dashboard-stat stat-interactions">
                            <h2><?php echo number_format($overall_metrics['total_interactions']); ?></h2>
                            <p>Total Interactions</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="dashboard-stat stat-viewers">
                            <h2><?php echo number_format($overall_metrics['unique_viewers']); ?></h2>
                            <p>Unique Viewers</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="dashboard-stat stat-rate">
                            <h2><?php echo $overall_metrics['interaction_rate']; ?>%</h2>
                            <p>Interaction Rate</p>
                        </div>
                    </div>
                </div>

                <!-- Daily Trends Chart -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-line-chart"></i> Daily Trends</h3>
                            </div>
                            <div class="panel-body">
                                <div class="chart-container">
                                    <canvas id="dailyTrendsChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Top Events Row -->
                <div class="row">
                    <!-- Most Popular Event -->
                    <div class="col-lg-4">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-star"></i> Most Popular Event</h3>
                            </div>
                            <div class="panel-body">
                                <?php if ($overall_metrics['most_popular_event'] != 'N/A') : ?>
                                    <h4><?php echo htmlspecialchars($overall_metrics['most_popular_event']); ?></h4>
                                    <p><strong><?php echo number_format($overall_metrics['most_popular_event_impressions']); ?></strong> impressions</p>
                                    <a href="event_detail.php?id=<?php echo $overall_metrics['most_popular_event_id']; ?>" class="btn btn-info btn-sm">
                                        <i class="fa fa-eye"></i> View Event Details
                                    </a>
                                <?php else : ?>
                                    <p class="text-muted">No data available for the selected filters.</p>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>

                    <!-- User Retention -->
                    <div class="col-lg-4">
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-users"></i> User Retention</h3>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-6 text-center">
                                        <h4><?php echo number_format($user_retention['total_users']); ?></h4>
                                        <p>Total Users</p>
                                    </div>
                                    <div class="col-xs-6 text-center">
                                        <h4><?php echo number_format($user_retention['returning_users']); ?></h4>
                                        <p>Returning Users</p>
                                    </div>
                                </div>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" 
                                         style="width: <?php echo $user_retention['retention_rate']; ?>%;">
                                        <?php echo number_format($user_retention['retention_rate'], 1); ?>% Retention Rate
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Trending Events -->
                    <div class="col-lg-4">
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-arrow-up"></i> Trending Events</h3>
                            </div>
                            <div class="panel-body">
                                <?php if (!empty($trending_events)) : ?>
                                    <?php foreach ($trending_events as $event) : ?>
                                        <div class="trending-event">
                                            <h4><?php echo htmlspecialchars($event['name']); ?></h4>
                                            <p>
                                                <span class="growth"><?php echo number_format($event['recent_impressions']); ?></span> recent impressions
                                                <br>
                                                <span class="<?php echo ($event['growth'] >= 0) ? 'growth' : 'negative-growth'; ?>">
                                                    <?php echo ($event['growth'] >= 0) ? '+' : ''; ?><?php echo number_format($event['growth']); ?> growth
                                                </span>
                                            </p>
                                            <a href="event_detail.php?id=<?php echo $event['id']; ?>" class="btn btn-info btn-sm">
                                                <i class="fa fa-eye"></i> View Event Details
                                            </a>
                                        </div>
                                    <?php endforeach; ?>
                                <?php else : ?>
                                    <p class="text-muted">No data available for the selected filters.</p>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Interaction Types and Sources -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-pie-chart"></i> Interaction Types</h3>
                            </div>
                            <div class="panel-body">
                                <div class="chart-container">
                                    <canvas id="interactionTypesChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-pie-chart"></i> Impression Sources</h3>
                            </div>
                            <div class="panel-body">
                                <div class="chart-container">
                                    <canvas id="impressionSourcesChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Time of Day Analysis -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-clock-o"></i> Time of Day Analysis</h3>
                            </div>
                            <div class="panel-body">
                                <div class="chart-container">
                                    <canvas id="timeOfDayChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Sponsored vs Non-Sponsored Events -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money"></i> Sponsored vs Non-Sponsored Events</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Type</th>
                                                <th>Event Count</th>
                                                <th>Total Impressions</th>
                                                <th>Total Interactions</th>
                                                <th>Engagement Rate</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($sponsored_comparison as $comparison): ?>
                                            <tr>
                                                <td><?php echo $comparison['is_sponsored'] ? 'Sponsored' : 'Non-Sponsored'; ?></td>
                                                <td><?php echo number_format($comparison['event_count']); ?></td>
                                                <td><?php echo number_format($comparison['total_impressions']); ?></td>
                                                <td><?php echo number_format($comparison['total_interactions']); ?></td>
                                                <td><?php echo number_format($comparison['engagement_rate'], 2); ?>%</td>
                                            </tr>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </section>
    

    <script>
        // Daily Trends Chart
        new Chart(document.getElementById('dailyTrendsChart').getContext('2d'), {
            type: 'line',
            data: {
                labels: <?php echo json_encode(array_column($daily_chart_data, 'date')); ?>,
                datasets: [{
                    label: 'Impressions',
                    data: <?php echo json_encode(array_column($daily_chart_data, 'impressions')); ?>,
                    borderColor: '#3498db',
                    fill: false
                }, {
                    label: 'Interactions',
                    data: <?php echo json_encode(array_column($daily_chart_data, 'interactions')); ?>,
                    borderColor: '#2ecc71',
                    fill: false
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Interaction Types Chart
        new Chart(document.getElementById('interactionTypesChart').getContext('2d'), {
            type: 'pie',
            data: {
                labels: <?php echo json_encode(array_column($interaction_types_chart_data, 'type')); ?>,
                datasets: [{
                    data: <?php echo json_encode(array_column($interaction_types_chart_data, 'count')); ?>,
                    backgroundColor: ['#3498db', '#2ecc71', '#9b59b6', '#e67e22', '#e74c3c']
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });

        // Impression Sources Chart
        new Chart(document.getElementById('impressionSourcesChart').getContext('2d'), {
            type: 'pie',
            data: {
                labels: <?php echo json_encode(array_column($impressions_source_chart_data, 'source')); ?>,
                datasets: [{
                    data: <?php echo json_encode(array_column($impressions_source_chart_data, 'count')); ?>,
                    backgroundColor: ['#3498db', '#2ecc71', '#9b59b6', '#e67e22', '#e74c3c']
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });

        // Time of Day Chart
        new Chart(document.getElementById('timeOfDayChart').getContext('2d'), {
            type: 'bar',
            data: {
                labels: <?php echo json_encode(array_column($time_of_day_chart_data, 'label')); ?>,
                datasets: [{
                    label: 'Impressions',
                    data: <?php echo json_encode(array_column($time_of_day_chart_data, 'count')); ?>,
                    backgroundColor: '#3498db'
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Initialize DataTables
        $(document).ready(function() {
            $('.table').DataTable({
                responsive: true,
                pageLength: 10,
                order: [[1, 'desc']]
            });

            // Initialize Bootstrap tooltips
            const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
            const tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl)
            });

            // Add loading state to forms
            $('form').on('submit', function() {
                $(this).find('button[type="submit"]').html('<i class="fa fa-spinner fa-spin"></i> Loading...');
                $(this).find('button[type="submit"]').prop('disabled', true);
            });

            // Enhanced chart configurations
            Chart.defaults.font.family = "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif";
            Chart.defaults.color = '#666';
            
            // Update existing charts with enhanced options
            // ...existing chart initialization code...
        });

        // Error handling functions
        function showError(message) {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: message,
                confirmButtonColor: '#3498db'
            });
        }

        function showWarning(message) {
            Swal.fire({
                icon: 'warning',
                title: 'Warning',
                text: message,
                confirmButtonColor: '#f39c12'
            });
        }

        function showSuccess(message) {
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: message,
                confirmButtonColor: '#2ecc71'
            });
        }

        // Add error handling to AJAX requests
        $(document).ajaxError(function(event, jqXHR, ajaxSettings, thrownError) {
            showError('An error occurred: ' + thrownError);
        });

        // Add error handling to charts
        Chart.defaults.plugins.error = {
            onError: function(chart, err) {
                showError('Chart error: ' + err.message);
            }
        };

        // Add form validation
        $('form').on('submit', function(e) {
            const dateStart = new Date($('input[name="date_start"]').val());
            const dateEnd = new Date($('input[name="date_end"]').val());

            if (dateEnd < dateStart) {
                e.preventDefault();
                showWarning('End date cannot be earlier than start date');
                return false;
            }
        });

        // Handle DataTables errors
        $.fn.dataTable.ext.errMode = 'none';
        $('.table').on('error.dt', function(e, settings, techNote, message) {
            showError('DataTable error: ' + message);
        });
    </script>

<?php include('footer.php'); ?>
</body>
</html>