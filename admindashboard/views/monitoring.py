from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib.admin.views.decorators import staff_member_required
from ..monitoring.services import SystemMonitor
from ..notifications.services import NotificationService

@staff_member_required
def monitoring_dashboard(request):
    """View for the system monitoring dashboard"""
    monitor = SystemMonitor()
    initial_metrics = monitor.collect_metrics()
    
    context = {
        'initial_metrics': initial_metrics,
        'page_title': 'System Monitoring',
        'section': 'monitoring'
    }
    return render(request, 'admindashboard/monitoring/dashboard.html', context)

@staff_member_required
def notifications_list(request):
    """View for the notifications list"""
    service = NotificationService()
    notifications = service.get_notifications(request.user)
    
    context = {
        'notifications': notifications,
        'page_title': 'Notifications',
        'section': 'notifications'
    }
    return render(request, 'admindashboard/notifications/list.html', context) 