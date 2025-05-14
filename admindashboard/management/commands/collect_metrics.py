from django.core.management.base import BaseCommand
from django.conf import settings
from admindashboard.monitoring.services import SystemMonitor
import time
import logging

logger = logging.getLogger(__name__)

class Command(BaseCommand):
    help = 'Collects system metrics at regular intervals'

    def handle(self, *args, **options):
        monitor = SystemMonitor()
        interval = getattr(settings, 'MONITORING', {}).get('METRICS_INTERVAL', 60)
        
        self.stdout.write(self.style.SUCCESS('Starting metrics collection...'))
        
        try:
            while True:
                metrics = monitor.collect_metrics()
                if metrics:
                    self.stdout.write(self.style.SUCCESS(
                        f'Collected metrics: CPU: {metrics["cpu_usage"]}%, '
                        f'Memory: {metrics["memory_usage"]}%, '
                        f'Disk: {metrics["disk_usage"]}%'
                    ))
                time.sleep(interval)
        except KeyboardInterrupt:
            self.stdout.write(self.style.WARNING('Stopping metrics collection...'))
        except Exception as e:
            logger.error(f'Error collecting metrics: {str(e)}') 