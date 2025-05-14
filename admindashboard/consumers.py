from channels.generic.websocket import JsonWebsocketConsumer
from asgiref.sync import async_to_sync
from .monitoring.services import SystemMonitor
import json
import logging

logger = logging.getLogger(__name__)

class DashboardConsumer(JsonWebsocketConsumer):
    def connect(self):
        """Handle WebSocket connection"""
        if not self.scope["user"].is_staff:
            self.close()
            return
            
        # Add to dashboard group
        async_to_sync(self.channel_layer.group_add)(
            "dashboard_updates",
            self.channel_name
        )
        self.accept()
        
        # Send initial data
        self.send_initial_data()

    def disconnect(self, close_code):
        """Handle WebSocket disconnection"""
        async_to_sync(self.channel_layer.group_discard)(
            "dashboard_updates",
            self.channel_name
        )

    def send_initial_data(self):
        """Send initial dashboard data"""
        try:
            monitor = SystemMonitor()
            metrics = monitor.collect_metrics()
            
            if metrics:
                self.send_json({
                    'type': 'initial_data',
                    'metrics': metrics
                })
        except Exception as e:
            logger.error(f"Error sending initial data: {str(e)}")

    def receive_json(self, content):
        """Handle incoming WebSocket messages"""
        message_type = content.get('type')
        
        if message_type == 'get_metrics':
            self.send_metrics_update()
        elif message_type == 'mark_notification_read':
            self.mark_notification_read(content.get('notification_id'))

    def send_metrics_update(self):
        """Send updated metrics"""
        try:
            monitor = SystemMonitor()
            metrics = monitor.collect_metrics()
            
            if metrics:
                self.send_json({
                    'type': 'metrics_update',
                    'metrics': metrics
                })
        except Exception as e:
            logger.error(f"Error sending metrics update: {str(e)}")

    def metrics_update(self, event):
        """Handle metrics update message"""
        self.send_json(event)

    def notification_message(self, event):
        """Handle notification message"""
        self.send_json(event)

class ActivityMonitorConsumer(JsonWebsocketConsumer):
    def connect(self):
        """Handle WebSocket connection"""
        if not self.scope["user"].is_staff:
            self.close()
            return
            
        async_to_sync(self.channel_layer.group_add)(
            "activity_monitor",
            self.channel_name
        )
        self.accept()

    def disconnect(self, close_code):
        """Handle WebSocket disconnection"""
        async_to_sync(self.channel_layer.group_discard)(
            "activity_monitor",
            self.channel_name
        )

    def activity_update(self, event):
        """Handle activity update message"""
        self.send_json(event['message']) 