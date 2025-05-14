from django.core.management.base import BaseCommand
from django.utils import timezone
from django.conf import settings
from admindashboard.monitoring.models import SystemMetrics, UserActivity
from datetime import timedelta
import logging

logger = logging.getLogger(__name__)

class Command(BaseCommand):
    help = 'Cleans up old metrics and activity data'

    def handle(self, *args, **options):
        try:
            retention_days = getattr(settings, 'MONITORING', {}).get('RETENTION_DAYS', 30)
            cutoff_date = timezone.now() - timedelta(days=retention_days)
            
            # Delete old system metrics
            metrics_deleted, _ = SystemMetrics.objects.filter(
                timestamp__lt=cutoff_date
            ).delete()
            
            # Delete old user activity
            activity_deleted, _ = UserActivity.objects.filter(
                timestamp__lt=cutoff_date
            ).delete()
            
            self.stdout.write(self.style.SUCCESS(
                f'Successfully cleaned up {metrics_deleted} metrics and '
                f'{activity_deleted} activity records older than {retention_days} days'
            ))
            
        except Exception as e:
            logger.error(f'Error cleaning up metrics: {str(e)}')
            self.stdout.write(self.style.ERROR(f'Error cleaning up metrics: {str(e)}')) 