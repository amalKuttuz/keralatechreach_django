from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils import timezone
from django.core.validators import MinValueValidator, MaxValueValidator

# Create your models here.

class AppVersion(models.Model):
    version_name = models.CharField(max_length=50)
    version_code = models.PositiveIntegerField()
    force_update = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.version_name} (code: {self.version_code})"

class CategoryModel(models.Model):
    name = models.CharField(max_length=255)
    image_url = models.URLField(blank=True, null=True)
    display_order = models.IntegerField(default=0)
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = 'Category'
        verbose_name_plural = 'Categories'

    def __str__(self):
        return self.name

class BudgetSelection(models.Model):
    title = models.CharField(max_length=255)
    category = models.ForeignKey(CategoryModel, on_delete=models.CASCADE)
    budget_limit = models.DecimalField(max_digits=10, decimal_places=2)
    image_url = models.URLField(blank=True, null=True)
    display_order = models.PositiveIntegerField(default=0)
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.title} (₹{self.budget_limit})"

class ContactMessage(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField()
    phone = models.CharField(max_length=20, blank=True, null=True)
    subject = models.CharField(max_length=200)
    message = models.TextField()
    status = models.CharField(max_length=20, default='pending')
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.name} - {self.subject}"

class SliderItem(models.Model):
    title = models.CharField(max_length=255)
    image_url = models.URLField()
    redirect_url = models.URLField(blank=True, null=True)
    display_order = models.PositiveIntegerField(default=0)
    status = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title

class Question(models.Model):
    degree = models.ForeignKey('admindashboard.Degree', on_delete=models.CASCADE)
    subject = models.CharField(max_length=255)
    semester = models.CharField(max_length=50)
    year = models.CharField(max_length=10)
    file = models.FileField(upload_to='question_papers/')
    status = models.BooleanField(default=False)
    university = models.ForeignKey('admindashboard.University', on_delete=models.CASCADE)
    upload_date = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return f"{self.degree} - {self.subject} (Sem {self.semester}, {self.year})"

class ApprovedQuestion(models.Model):
    degree = models.ForeignKey('admindashboard.Degree', on_delete=models.CASCADE)
    semester = models.CharField(max_length=200)
    subject = models.CharField(max_length=200)
    question_text = models.FileField(upload_to='approved_questions/')
    year = models.IntegerField()
    question = models.ForeignKey(Question, on_delete=models.SET_NULL, null=True, blank=True)
    university = models.ForeignKey('admindashboard.University', on_delete=models.CASCADE)
    updated_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.degree} - {self.subject} ({self.year})"

class Product(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField()
    category = models.ForeignKey(CategoryModel, on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    image_url = models.URLField()
    affiliate_url = models.URLField()
    affiliate_code = models.CharField(max_length=255, blank=True, null=True)
    rating = models.PositiveSmallIntegerField(
        validators=[MinValueValidator(1), MaxValueValidator(5)],
        default=1
    )
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title
