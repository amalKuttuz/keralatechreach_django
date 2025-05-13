# api/models.py

from django.db import models

class QuestionPaper(models.Model):
    degree = models.ForeignKey('Degree', on_delete=models.CASCADE)
    semester = models.PositiveIntegerField()
    subject = models.CharField(max_length=200)
    file_path = models.FileField(upload_to='question_papers/', blank=True, null=True)
    year = models.PositiveIntegerField()
    university_id = models.ForeignKey('University', on_delete=models.CASCADE)
    updated_at = models.DateTimeField(auto_now=True)
    is_published = models.BooleanField(default=False)
    created_by = models.ForeignKey('UserProfile', on_delete=models.CASCADE)
    def __str__(self):
        return f"{self.degree} | Sem {self.semester} | {self.subject} ({self.year})"
    
class University(models.Model):
    name = models.CharField(max_length=200)
    created_by = models.ForeignKey('UserProfile', on_delete=models.CASCADE)

    def __str__(self):
        return self.name

class Degree(models.Model):
    name = models.CharField(max_length=200)
    university = models.ForeignKey(University, on_delete=models.CASCADE)
    created_by = models.ForeignKey('UserProfile', on_delete=models.CASCADE)
    def __str__(self):
        return f"{self.name} ({self.university.name})"

class Exam(models.Model):
    exam_name = models.CharField(max_length=255)
    exam_date = models.DateField()
    exam_url = models.URLField()
    degree_name = models.ForeignKey(Degree, on_delete=models.CASCADE)
    semester = models.CharField(max_length=10)
    admission_year = models.PositiveIntegerField()
    university = models.ForeignKey(University, on_delete=models.CASCADE)
    updated_at = models.DateTimeField(auto_now=True)
    is_published = models.BooleanField(default=False)
    created_by = models.ForeignKey('UserProfile', on_delete=models.CASCADE)


class Job(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField()
    last_date = models.DateField()
    updated_at = models.DateTimeField(auto_now=True)
    is_published = models.BooleanField(default=False)
    created_by = models.ForeignKey('UserProfile', on_delete=models.CASCADE)
    def __str__(self):
        return self.title

class District(models.Model):
    name = models.CharField(max_length=100)
    created_by = models.ForeignKey('UserProfile', on_delete=models.CASCADE, related_name='created_districts')
    def __str__(self):
        return self.name


class Initiative(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField(blank=True)
    link = models.URLField(blank=True, null=True)
    photo = models.ImageField(upload_to='initiatives/', blank=True, null=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_published = models.BooleanField(default=False)
    created_by = models.ForeignKey('UserProfile', on_delete=models.CASCADE)
    def __str__(self):
        return self.name

class EventCategory(models.Model):
    category = models.CharField(max_length=255)
    created_by = models.ForeignKey('UserProfile', on_delete=models.CASCADE)
    def __str__(self):
        return self.category

class Event(models.Model):
    name = models.CharField(max_length=255)
    event_start = models.DateTimeField()
    event_end = models.DateTimeField(blank=True, null=True)
    place = models.CharField(max_length=255)
    link = models.URLField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    map_link = models.URLField(blank=True, null=True)
    district = models.ForeignKey(District, on_delete=models.SET_NULL, null=True, blank=True)
    category = models.ForeignKey(EventCategory, on_delete=models.SET_NULL, null=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_published = models.BooleanField(default=False)
    created_by = models.ForeignKey('UserProfile', on_delete=models.CASCADE)
    def __str__(self):
        return self.name

class News(models.Model):
    title = models.CharField(max_length=255)
    content = models.TextField()
    image = models.ImageField(upload_to='news/', blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_published = models.BooleanField(default=False)
    created_by = models.ForeignKey('UserProfile', on_delete=models.CASCADE)
    class Meta:
        verbose_name_plural = "News"

    def __str__(self):
        return self.title

class ContactMessage(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField()
    subject = models.CharField(max_length=200)
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    is_read = models.BooleanField(default=False)
    created_by = models.ForeignKey('UserProfile', on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.subject} - {self.name}"

class Gallery(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField(blank=True)
    image = models.ImageField(upload_to='gallery/')
    created_at = models.DateTimeField(auto_now_add=True)
    is_visible = models.BooleanField(default=True)
    created_by = models.ForeignKey('UserProfile', on_delete=models.CASCADE)
    class Meta:
        verbose_name_plural = "Galleries"

    def __str__(self):
        return self.title

class SiteSetting(models.Model):
    key = models.CharField(max_length=50, unique=True)
    value = models.TextField()
    description = models.TextField(blank=True)
    is_public = models.BooleanField(default=True)
    updated_at = models.DateTimeField(auto_now=True)
    created_by = models.ForeignKey('UserProfile', on_delete=models.CASCADE)
    def __str__(self):
        return self.key

class UserProfile(models.Model):
    user = models.OneToOneField('auth.User', on_delete=models.CASCADE)
    phone = models.CharField(max_length=15, blank=True, null=True)
    district = models.ForeignKey(District, on_delete=models.SET_NULL, null=True, blank=True)
    profile_picture = models.ImageField(upload_to='profiles/', blank=True, null=True)
    bio = models.TextField(blank=True)
    email = models.EmailField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    created_by = models.ForeignKey('UserProfile', on_delete=models.CASCADE)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_verified = models.BooleanField(default=False)
    is_approved = models.BooleanField(default=False)
    is_blocked = models.BooleanField(default=False)
    is_deleted = models.BooleanField(default=False)
    
    def __str__(self):
        return self.user.username