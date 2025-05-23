<!-- filepath: e:\KSTUDENTS\backups\april 23\Staff\footer.php -->
    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const sidebar = document.getElementById('sidebar');
        const openSidebarBtn = document.getElementById('open-sidebar');
        const closeSidebarBtn = document.getElementById('close-sidebar');
        const menuItemsWithSubmenu = document.querySelectorAll('.has-submenu');

        // Toggle sidebar
        openSidebarBtn.addEventListener('click', () => {
            sidebar.classList.remove('sidebar-closed');
        });

        closeSidebarBtn.addEventListener('click', () => {
            sidebar.classList.add('sidebar-closed');
        });

        // Toggle submenus
        menuItemsWithSubmenu.forEach(item => {
            item.addEventListener('click', () => {
                const submenu = item.querySelector('.submenu');
                submenu.style.display = submenu.style.display === 'block' ? 'none' : 'block';
            });
        });

        // Close sidebar on mobile when clicking outside
        document.addEventListener('click', (e) => {
            if (!sidebar.contains(e.target) && !openSidebarBtn.contains(e.target) && window.innerWidth < 768) {
                sidebar.classList.add('sidebar-closed');
            }
        });

        // Adjust sidebar on window resize
        window.addEventListener('resize', () => {
            if (window.innerWidth >= 768) {
                sidebar.classList.remove('sidebar-closed');
            } else {
                sidebar.classList.add('sidebar-closed');
            }
        });
    </script>
</body>
</html>