import os
import resource
import time
from django.core.cache import cache
from django.db import connection
from django.utils import timezone
from datetime import timedelta
from .models import SystemMetrics, UserActivity
import logging

logger = logging.getLogger(__name__)

class SystemMonitor:
    def __init__(self):
        self.metrics_history = {}
        self.alert_thresholds = {
            'cpu_usage': 80,
            'memory_usage': 85,
            'disk_usage': 90,
            'response_time': 2,
            'error_rate': 5
        }

    def collect_metrics(self):
        """Collect current system metrics using cPanel-friendly methods"""
        try:
            # Get memory usage from resource module
            memory_usage = self._get_memory_usage()
            
            # Get disk usage for the current directory
            disk_usage = self._get_disk_usage()
            
            # Get CPU load from /proc/loadavg if available, otherwise estimate
            cpu_usage = self._get_cpu_usage()
            
            metrics = {
                'cpu_usage': cpu_usage,
                'memory_usage': memory_usage,
                'disk_usage': disk_usage,
                'response_time': self._get_average_response_time(),
                'active_users': self._get_active_users_count(),
                'error_count': self._get_error_count()
            }
            
            # Save metrics to database
            SystemMetrics.objects.create(**metrics)
            
            # Check for alerts
            self._check_alerts(metrics)
            
            return metrics
        except Exception as e:
            logger.error(f"Error collecting system metrics: {str(e)}")
            return None

    def _get_memory_usage(self):
        """Get memory usage using resource module"""
        try:
            usage = resource.getrusage(resource.RUSAGE_SELF)
            # Convert to percentage based on cPanel memory limit
            memory_limit = int(os.getenv('MEMORY_LIMIT_IN_BYTES', 256 * 1024 * 1024))  # Default 256MB
            memory_usage = (usage.ru_maxrss * 1024 * 100) / memory_limit
            return min(memory_usage, 100)
        except Exception as e:
            logger.warning(f"Could not get memory usage: {str(e)}")
            return 0

    def _get_disk_usage(self):
        """Get disk usage for the current directory"""
        try:
            stat = os.statvfs('.')
            total = stat.f_blocks * stat.f_frsize
            free = stat.f_bfree * stat.f_frsize
            used = total - free
            return (used * 100) / total
        except Exception as e:
            logger.warning(f"Could not get disk usage: {str(e)}")
            return 0

    def _get_cpu_usage(self):
        """Get CPU usage estimate"""
        try:
            # Try to read from /proc/loadavg first
            if os.path.exists('/proc/loadavg'):
                with open('/proc/loadavg', 'r') as f:
                    load = float(f.read().split()[0])
                    # Convert load average to percentage (assume load of 1 = 100%)
                    return min(load * 100, 100)
            else:
                # Fallback to basic CPU time measurement
                start_time = time.time()
                start_cpu = time.clock()
                # Perform some computation
                for i in range(1000000):
                    _ = i * i
                end_cpu = time.clock()
                end_time = time.time()
                cpu_usage = ((end_cpu - start_cpu) / (end_time - start_time)) * 100
                return min(cpu_usage, 100)
        except Exception as e:
            logger.warning(f"Could not get CPU usage: {str(e)}")
            return 0

    def _get_average_response_time(self):
        """Get average response time from cache"""
        response_times = cache.get('response_times', [])
        if response_times:
            return sum(response_times) / len(response_times)
        return 0

    def _get_active_users_count(self):
        """Get count of users active in the last 15 minutes"""
        fifteen_mins_ago = timezone.now() - timedelta(minutes=15)
        return UserActivity.objects.filter(
            timestamp__gte=fifteen_mins_ago
        ).values('user').distinct().count()

    def _get_error_count(self):
        """Get error count from the last hour"""
        return cache.get('error_count', 0)

    def _check_alerts(self, metrics):
        """Check metrics against thresholds and generate alerts"""
        from ..notifications.services import NotificationService
        
        for metric, value in metrics.items():
            if metric in self.alert_thresholds:
                threshold = self.alert_thresholds[metric]
                if value > threshold:
                    NotificationService().create_notification(
                        title=f"High {metric.replace('_', ' ')}",
                        message=f"{metric.replace('_', ' ').title()} is at {value}% (threshold: {threshold}%)",
                        level='warning',
                        notification_type='system_alert',
                        metadata={'metric': metric, 'value': value, 'threshold': threshold}
                    )

class ActivityMonitor:
    @staticmethod
    def log_activity(user, action, resource, request, extra_data=None):
        """Log user activity"""
        try:
            activity = UserActivity.objects.create(
                user=user,
                action=action,
                resource=resource,
                ip_address=ActivityMonitor._get_client_ip(request),
                user_agent=request.META.get('HTTP_USER_AGENT', ''),
                extra_data=extra_data or {}
            )
            
            # Broadcast activity through websocket
            ActivityMonitor._broadcast_activity(activity)
            
            return activity
        except Exception as e:
            logger.error(f"Error logging user activity: {str(e)}")
            return None

    @staticmethod
    def _get_client_ip(request):
        """Get client IP address from request"""
        x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
        return x_forwarded_for.split(',')[0] if x_forwarded_for else request.META.get('REMOTE_ADDR')

    @staticmethod
    def _broadcast_activity(activity):
        """Broadcast activity through websocket"""
        try:
            from channels.layers import get_channel_layer
            from asgiref.sync import async_to_sync
            
            channel_layer = get_channel_layer()
            async_to_sync(channel_layer.group_send)(
                "activity_monitor",
                {
                    "type": "activity_update",
                    "message": {
                        "user": activity.user.username,
                        "action": activity.action,
                        "resource": activity.resource,
                        "timestamp": activity.timestamp.isoformat()
                    }
                }
            )
        except Exception as e:
            logger.error(f"Error broadcasting activity: {str(e)}") 