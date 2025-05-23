<!-- filepath: e:\KSTUDENTS\backups\april 23\Staff\head.php -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Sidebar with Bootstrap</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .sidebar {
            height: 100vh;
            background-color: #2c3e50;
            color: white;
            padding: 15px;
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            transition: transform 0.3s ease;
            z-index: 1050;
        }

        .sidebar-closed {
            transform: translateX(-100%);
        }

        .sidebar .menu-item {
            padding: 10px 15px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .sidebar .menu-item:hover {
            background-color: #34495e;
        }

        .sidebar .menu-item.active {
            background-color: #3498db;
        }

        .submenu {
            list-style: none;
            padding-left: 20px;
            display: none;
        }

        .submenu-item {
            padding: 5px 0;
            cursor: pointer;
        }

        .submenu-item:hover {
            color: #3498db;
        }

        .main-content {
            margin-left: 250px;
            padding: 20px;
            transition: margin-left 0.3s ease;
        }

        .sidebar-closed ~ .main-content {
            margin-left: 0;
        }

        @media (max-width: 767px) {
            .sidebar {
                width: 80%;
                max-width: 250px;
            }

            .main-content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>

    <div class="d-flex">
        <!-- Sidebar -->
        <nav class="sidebar sidebar-closed" id="sidebar">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h5 class="m-0">Menu</h5>
                <button class="btn btn-sm btn-light" id="close-sidebar">×</button>
            </div>
            <ul class="list-unstyled">
                <li class="menu-item active"><a href="home.php" class="text-decoration-none text-white">Home</a></li>
                <li class="menu-item has-submenu">
                    Questions
                    <ul class="submenu">
                        <li class="submenu-item"><a href="questions_add.php" class="text-decoration-none text-white">Add Questions</a></li>
                        <li class="submenu-item"><a href="questions_view.php" class="text-decoration-none text-white">View Questions</a></li>
                        <li class="submenu-item"><a href="questions_new.php" class="text-decoration-none text-white">New Questions</a></li>
                    </ul>
                </li>
                <li class="menu-item has-submenu">
                    Notes
                    <ul class="submenu">
                        <li class="submenu-item"><a href="notes_add.php" class="text-decoration-none text-white">Add Notes</a></li>
                        <li class="submenu-item"><a href="notes_view.php" class="text-decoration-none text-white">View Notes</a></li>
                        <li class="submenu-item"><a href="notes_new.php" class="text-decoration-none text-white">New Notes</a></li>
                    </ul>
                </li>
                <li class="menu-item has-submenu">
                    Jobs
                    <ul class="submenu">
                        <li class="submenu-item"><a href="jobs_add.php" class="text-decoration-none text-white">Add Jobs</a></li>
                        <li class="submenu-item"><a href="jobs_view.php" class="text-decoration-none text-white">View Jobs</a></li>
                    </ul>
                </li>
                <li class="menu-item has-submenu">
                    Events
                    <ul class="submenu">
                        <li class="submenu-item"><a href="events_add.php" class="text-decoration-none text-white">Add Events</a></li>
                        <li class="submenu-item"><a href="events_view.php" class="text-decoration-none text-white">View Events</a></li>
                    </ul>
                </li>
                <li class="menu-item has-submenu">
                    Govt Initiatives
                    <ul class="submenu">
                        <li class="submenu-item"><a href="initiatives_add.php" class="text-decoration-none text-white">Add Initiatives</a></li>
                        <li class="submenu-item"><a href="initiatives_view.php" class="text-decoration-none text-white">View Initiatives</a></li>
                    </ul>
                </li>
                <li class="menu-item has-submenu">
                    Exam
                    <ul class="submenu">
                        <li class="submenu-item"><a href="exam_add.php" class="text-decoration-none text-white">Add Exam</a></li>
                        <li class="submenu-item"><a href="exam_view.php" class="text-decoration-none text-white">View Exams</a></li>
                    </ul>
                </li>
                <li class="menu-item"><a href="app_messages.php" class="text-decoration-none text-white">App Messages</a></li>
                <li class="menu-item"><a href="logout.php" class="text-decoration-none text-white">Logout</a></li>
            </ul>
        </nav>
