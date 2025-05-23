from django.db import models
from .file_handling import (
    question_paper_upload_path, 
    notes_upload_path,
    FileValidator,
    ALLOWED_FILE_TYPES
)


class University(models.Model):
    id = models.AutoField(primary_key=True)
    university_name = models.CharField(max_length=255)
    updated_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.university_name
    
    class Meta:
        db_table = 'university'
        verbose_name_plural = 'Universities'


class Degree(models.Model):
    id = models.AutoField(primary_key=True)
    degree_name = models.CharField(max_length=100)
    university = models.ForeignKey(University, on_delete=models.CASCADE)
    updated_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.degree_name} - {self.university.university_name}"
    
    class Meta:
        db_table = 'degree'
        unique_together = ('degree_name', 'university')
        verbose_name_plural = 'Degrees'


class District(models.Model):
    district_id = models.AutoField(primary_key=True)
    district = models.CharField(max_length=255)
    name = models.CharField(max_length=255, null=True, blank=True)
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey('admindashboard.UserProfile', on_delete=models.SET_NULL, null=True, blank=True, related_name='created_districts')

    def save(self, *args, **kwargs):
        # Ensure district and name are in sync
        if not self.district and self.name:
            self.district = self.name
        elif not self.name and self.district:
            self.name = self.district
        super().save(*args, **kwargs)

    def __str__(self):
        return self.district
    
    class Meta:
        db_table = 'districts'


class EventCategory(models.Model):
    category_id = models.AutoField(primary_key=True)
    category = models.CharField(max_length=50)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.category
    
    class Meta:
        db_table = 'event_category'
        verbose_name_plural = 'Event Categories'


class Event(models.Model):
    id = models.AutoField(primary_key=True)
    category = models.ForeignKey(EventCategory, on_delete=models.CASCADE, db_column='category_id')
    event_start = models.DateField()
    event_end = models.DateField()
    name = models.CharField(max_length=255)
    place = models.CharField(max_length=255)
    link = models.CharField(max_length=255)
    map_link = models.CharField(max_length=255)
    description = models.TextField()
    district = models.ForeignKey(District, on_delete=models.CASCADE, db_column='district_id', related_name='kerala_events')
    created_at = models.DateTimeField(auto_now_add=True)
    is_sponsored = models.IntegerField(default=0)
    sponsor_name = models.TextField(null=True, blank=True)
    sponsor_logo_url = models.TextField(null=True, blank=True)
    sponsor_level = models.TextField(null=True, blank=True)
    sponsored_until = models.DateTimeField(null=True, blank=True)
    is_published = models.BooleanField(default=True)

    def __str__(self):
        return self.name
    
    class Meta:
        db_table = 'events'


class EventImpression(models.Model):
    id = models.AutoField(primary_key=True)
    event = models.ForeignKey(Event, on_delete=models.CASCADE, db_column='event_id')
    user_id = models.TextField(null=True, blank=True)
    timestamp = models.TextField(null=True, blank=True)
    source = models.TextField(null=True, blank=True)

    def __str__(self):
        return f"Impression: {self.event.name}"
    
    class Meta:
        db_table = 'event_impressions'


class Question(models.Model):
    id = models.AutoField(primary_key=True)
    deg = models.CharField(max_length=255)
    subj = models.CharField(max_length=255)
    sem = models.CharField(max_length=50)
    qyear = models.CharField(max_length=10)
    file = models.FileField(
        upload_to=question_paper_upload_path,
        validators=[FileValidator(
            max_size=10*1024*1024,  # 10MB
            allowed_extensions=ALLOWED_FILE_TYPES['question_papers']
        )]
    )
    status = models.BooleanField(default=False)
    university = models.CharField(max_length=255)
    upload_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.deg} - {self.subj} - Sem {self.sem} ({self.qyear})"
    
    class Meta:
        db_table = 'question'

    def get_absolute_url(self):
        """Return the URL to view this question paper"""
        from django.urls import reverse
        return reverse('view_question', args=[str(self.id)])

    def save(self, *args, **kwargs):
        # Delete old file when updating
        if self.pk:
            try:
                old_instance = Question.objects.get(pk=self.pk)
                if old_instance.file != self.file:
                    old_instance.file.delete(save=False)
            except Question.DoesNotExist:
                pass  # Object is new
        super().save(*args, **kwargs)

    def delete(self, *args, **kwargs):
        # Delete the file when the model instance is deleted
        self.file.delete(save=False)
        super().delete(*args, **kwargs)


class ApprovedQuestion(models.Model):
    approved_id = models.AutoField(primary_key=True)
    deg = models.CharField(max_length=200)
    sem = models.CharField(max_length=200)
    subj = models.CharField(max_length=200)
    qtext = models.CharField(max_length=200)
    qyear = models.IntegerField()
    q_id = models.IntegerField()
    university = models.IntegerField()
    updated_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.deg} - {self.subj} - Sem {self.sem} ({self.qyear})"
    
    class Meta:
        db_table = 'approved'


class AppVersion(models.Model):
    id = models.AutoField(primary_key=True)
    version_code = models.IntegerField()
    version_name = models.CharField(max_length=50)
    update_url = models.CharField(max_length=255)
    update_message = models.TextField(null=True, blank=True)
    is_active = models.BooleanField(default=True)
    is_mandatory = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.version_name} (Code: {self.version_code})"
    
    class Meta:
        db_table = 'app_versions'


class Category(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    image_url = models.CharField(max_length=500)
    display_order = models.IntegerField(default=0)
    status = models.IntegerField(default=1)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name
    
    class Meta:
        db_table = 'categories'
        verbose_name_plural = 'Categories'


class BudgetSelection(models.Model):
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, db_column='category_id')
    budget_limit = models.IntegerField()
    image_url = models.CharField(max_length=500)
    display_order = models.IntegerField(default=0)
    status = models.IntegerField(default=1)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title
    
    class Meta:
        db_table = 'budget_selections'


class ContactMessage(models.Model):
    message_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    phone = models.CharField(max_length=20, null=True, blank=True)
    subject = models.CharField(max_length=150, null=True, blank=True)
    message = models.TextField(null=True, blank=True)
    status = models.CharField(max_length=20, default="pending")
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.name} - {self.subject}"
    
    class Meta:
        db_table = 'contact_messages'


class Slider(models.Model):
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255)
    image_url = models.CharField(max_length=500)
    redirect_url = models.CharField(max_length=500)
    display_order = models.IntegerField(default=0)
    status = models.IntegerField(default=1)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title
    
    class Meta:
        db_table = 'sliders'


class Staff(models.Model):
    id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=50)
    password = models.CharField(max_length=255)

    def __str__(self):
        return self.username
    
    class Meta:
        db_table = 'staff'


class User(models.Model):
    id = models.AutoField(primary_key=True)
    userid = models.CharField(max_length=200)
    password = models.CharField(max_length=200)

    def __str__(self):
        return self.userid
    
    class Meta:
        db_table = 'users'


class EntranceNotification(models.Model):
    id = models.AutoField(primary_key=True)
    entrance_name = models.CharField(max_length=255)
    category = models.CharField(max_length=255)
    deadline_date = models.DateField()
    website_url = models.CharField(max_length=255, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    is_published = models.BooleanField(default=True)

    def __str__(self):
        return self.entrance_name
    
    class Meta:
        db_table = 'entrance_notifications'


# Models for the missing tables in todo.md
class NotesUpload(models.Model):
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    file_path = models.FileField(
        upload_to=notes_upload_path,
        validators=[FileValidator(
            max_size=20*1024*1024,  # 20MB
            allowed_extensions=ALLOWED_FILE_TYPES['notes']
        )]
    )
    uploaded_by = models.ForeignKey(User, on_delete=models.CASCADE)
    uploaded_at = models.DateTimeField(auto_now_add=True)
    status = models.BooleanField(default=False)
    
    def __str__(self):
        return self.title

    def get_absolute_url(self):
        """Return the URL to view this note"""
        from django.urls import reverse
        return reverse('view_notes', args=[str(self.id)])

    def save(self, *args, **kwargs):
        # Delete old file when updating
        if self.pk:
            try:
                old_instance = NotesUpload.objects.get(pk=self.pk)
                if old_instance.file_path != self.file_path:
                    old_instance.file_path.delete(save=False)
            except NotesUpload.DoesNotExist:
                pass  # Object is new
        super().save(*args, **kwargs)

    def delete(self, *args, **kwargs):
        # Delete the file when the model instance is deleted
        self.file_path.delete(save=False)
        super().delete(*args, **kwargs)
    
    class Meta:
        db_table = 'notes_upload'


class EventInteraction(models.Model):
    INTERACTION_TYPES = [
        ('view', 'View Details'),
        ('click', 'Click Link'),
        ('share', 'Share Event'),
        ('register', 'Register')
    ]
    
    id = models.AutoField(primary_key=True)
    event = models.ForeignKey(Event, on_delete=models.CASCADE)
    user_id = models.TextField(null=True, blank=True)
    interaction_type = models.CharField(max_length=50, choices=INTERACTION_TYPES)
    timestamp = models.DateTimeField(auto_now_add=True)
    ip_address = models.GenericIPAddressField(null=True, blank=True)
    
    def __str__(self):
        return f"{self.interaction_type}: {self.event.name}"


class Product(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    description = models.TextField(null=True, blank=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    image_url = models.CharField(max_length=500)
    product_url = models.CharField(max_length=1000)
    is_featured = models.BooleanField(default=False)
    status = models.IntegerField(default=1)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return self.name 