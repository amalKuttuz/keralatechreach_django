from django.db import models
from django.contrib.auth import get_user_model
from django.utils import timezone

class UserActivity(models.Model):
    USER_ACTIONS = (
        ('login', 'User Login'),
        ('logout', 'User Logout'),
        ('view', 'Page View'),
        ('create', 'Resource Creation'),
        ('update', 'Resource Update'),
        ('delete', 'Resource Deletion'),
        ('download', 'File Download'),
        ('upload', 'File Upload'),
        ('api_call', 'API Call'),
    )
    
    user = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)
    action = models.CharField(max_length=20, choices=USER_ACTIONS)
    resource = models.CharField(max_length=255)
    ip_address = models.GenericIPAddressField()
    user_agent = models.TextField()
    timestamp = models.DateTimeField(auto_now_add=True)
    extra_data = models.JSONField(default=dict)
    
    class Meta:
        indexes = [
            models.Index(fields=['user', 'action', 'timestamp']),
        ]
        ordering = ['-timestamp']

class SystemMetrics(models.Model):
    timestamp = models.DateTimeField(auto_now_add=True)
    cpu_usage = models.FloatField()
    memory_usage = models.FloatField()
    disk_usage = models.FloatField()
    response_time = models.FloatField()
    active_users = models.IntegerField()
    error_count = models.IntegerField(default=0)
    
    class Meta:
        indexes = [
            models.Index(fields=['timestamp']),
        ]
        ordering = ['-timestamp'] 