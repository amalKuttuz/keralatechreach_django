from rest_framework.viewsets import ViewSet
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.permissions import IsAdminUser
from ..monitoring.services import SystemMonitor, ActivityMonitor
from ..notifications.services import NotificationService
from django.utils import timezone
from datetime import timedelta

class DashboardViewSet(ViewSet):
    permission_classes = [IsAdminUser]

    @action(detail=False, methods=['get'])
    def system_metrics(self, request):
        """Get current system metrics"""
        monitor = SystemMonitor()
        metrics = monitor.collect_metrics()
        return Response(metrics)

    @action(detail=False, methods=['get'])
    def activity_feed(self, request):
        """Get recent activity feed"""
        from ..monitoring.models import UserActivity
        
        # Get activities from last 24 hours
        since = timezone.now() - timedelta(hours=24)
        activities = UserActivity.objects.filter(
            timestamp__gte=since
        ).select_related('user')[:50]
        
        activity_data = [{
            'user': activity.user.username,
            'action': activity.action,
            'resource': activity.resource,
            'timestamp': activity.timestamp.isoformat(),
            'ip_address': activity.ip_address
        } for activity in activities]
        
        return Response(activity_data)

    @action(detail=False, methods=['get'])
    def notifications(self, request):
        """Get notifications for current user"""
        service = NotificationService()
        unread_only = request.query_params.get('unread_only') == 'true'
        notification_type = request.query_params.get('type')
        
        notifications = service.get_notifications(
            request.user,
            unread_only=unread_only,
            notification_type=notification_type
        )
        
        notification_data = [{
            'id': n.id,
            'title': n.title,
            'message': n.message,
            'level': n.level,
            'type': n.notification_type,
            'created_at': n.created_at.isoformat(),
            'is_read': request.user in n.read_by.all(),
            'metadata': n.metadata
        } for n in notifications[:50]]
        
        return Response(notification_data)

    @action(detail=True, methods=['post'])
    def mark_notification_read(self, request, pk=None):
        """Mark a notification as read"""
        service = NotificationService()
        success = service.mark_as_read(pk, request.user)
        return Response({'success': success})

    @action(detail=False, methods=['post'])
    def mark_all_notifications_read(self, request):
        """Mark all notifications as read"""
        service = NotificationService()
        service.mark_all_as_read(request.user)
        return Response({'success': True}) 