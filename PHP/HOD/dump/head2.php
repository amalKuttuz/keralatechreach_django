<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/style2.css">
</head>
<body>
    <!-- Main Wrapper -->
    <div class="container">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="logo">
                <h2>Admin Panel</h2>
            </div>
            <nav class="sidebar-nav">
                <ul>
                    <li><a href="index.php">Dashboard</a></li>
                    <li><a href="users.php">Users</a></li>
                    <li><a href="settings.php">Settings</a></li>
                    <li><a href="reports.php">Reports</a></li>
                </ul>
            </nav>
        </aside>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Top Navbar -->
            <header class="top-nav">
                <div class="nav-left">
                    <span class="logo">Admin</span>
                </div>
                <div class="nav-right">
                    <a href="logout.php" class="logout-btn">Logout</a>
                </div>
            </header>

            <!-- Content Area -->
            <section class="content">
                <h1>Welcome to the Dashboard</h1>
                <p>This is the admin area where you can manage users, settings, and reports.</p>
            </section>
        </div>
    </div>
</body>
</html>
