from django.core.mail import send_mail
from django.conf import settings
from django.contrib.auth import get_user_model
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync
from .models import AdminNotification
import logging

logger = logging.getLogger(__name__)

class NotificationService:
    def __init__(self):
        self.channel_layer = get_channel_layer()

    def create_notification(self, title, message, level='info', notification_type='info', metadata=None):
        """Create and send a new notification"""
        try:
            # Create notification
            notification = AdminNotification.objects.create(
                title=title,
                message=message,
                level=level,
                notification_type=notification_type,
                metadata=metadata or {}
            )
            
            # Send real-time notification
            self._send_realtime_notification(notification)
            
            # Send email for critical notifications
            if level == 'critical':
                self._send_email_notification(notification)
            
            return notification
        except Exception as e:
            logger.error(f"Error creating notification: {str(e)}")
            return None

    def _send_realtime_notification(self, notification):
        """Send notification through websocket"""
        try:
            async_to_sync(self.channel_layer.group_send)(
                "admin_notifications",
                {
                    "type": "notification.message",
                    "message": {
                        "id": notification.id,
                        "title": notification.title,
                        "message": notification.message,
                        "level": notification.level,
                        "type": notification.notification_type,
                        "created_at": notification.created_at.isoformat(),
                        "metadata": notification.metadata
                    }
                }
            )
        except Exception as e:
            logger.error(f"Error sending realtime notification: {str(e)}")

    def _send_email_notification(self, notification):
        """Send email notification to admin users"""
        try:
            admin_users = get_user_model().objects.filter(is_staff=True, is_active=True)
            admin_emails = [user.email for user in admin_users if user.email]
            
            if admin_emails:
                send_mail(
                    subject=f"[CRITICAL] {notification.title}",
                    message=notification.message,
                    from_email=settings.DEFAULT_FROM_EMAIL,
                    recipient_list=admin_emails,
                    fail_silently=True
                )
        except Exception as e:
            logger.error(f"Error sending email notification: {str(e)}")

    def get_notifications(self, user, unread_only=False, notification_type=None):
        """Get notifications for a user"""
        queryset = AdminNotification.objects.all()
        
        if unread_only:
            queryset = queryset.exclude(read_by=user)
            
        if notification_type:
            queryset = queryset.filter(notification_type=notification_type)
            
        return queryset.order_by('-created_at')

    def mark_as_read(self, notification_id, user):
        """Mark a notification as read"""
        try:
            notification = AdminNotification.objects.get(id=notification_id)
            notification.mark_as_read(user)
            return True
        except AdminNotification.DoesNotExist:
            return False

    def mark_all_as_read(self, user):
        """Mark all notifications as read for a user"""
        notifications = AdminNotification.objects.exclude(read_by=user)
        for notification in notifications:
            notification.mark_as_read(user) 