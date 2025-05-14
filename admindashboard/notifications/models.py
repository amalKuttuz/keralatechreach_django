from django.db import models
from django.contrib.auth import get_user_model

class AdminNotification(models.Model):
    LEVELS = (
        ('info', 'Information'),
        ('warning', 'Warning'),
        ('critical', 'Critical'),
    )
    
    NOTIFICATION_TYPES = (
        ('system_alert', 'System Alert'),
        ('user_activity', 'User Activity'),
        ('performance_alert', 'Performance Alert'),
        ('security_alert', 'Security Alert'),
        ('info', 'Information'),
    )
    
    title = models.CharField(max_length=200)
    message = models.TextField()
    level = models.CharField(max_length=20, choices=LEVELS)
    notification_type = models.CharField(max_length=50, choices=NOTIFICATION_TYPES)
    created_at = models.DateTimeField(auto_now_add=True)
    read_by = models.ManyToManyField(
        get_user_model(),
        related_name='read_notifications',
        blank=True
    )
    metadata = models.JSONField(default=dict)
    
    class Meta:
        ordering = ['-created_at']
        indexes = [
            models.Index(fields=['level', 'created_at']),
            models.Index(fields=['notification_type']),
        ]

    def __str__(self):
        return f"{self.get_level_display()}: {self.title}"

    def mark_as_read(self, user):
        self.read_by.add(user)
        self.save() 