# api/models.py

from django.db import models

class ApprovedQuestionPaper(models.Model):
    degree = models.CharField(max_length=200)
    semester = models.PositiveIntegerField()
    subject = models.CharField(max_length=200)
    file_path = models.CharField(max_length=200)  # renamed from qtext
    year = models.PositiveIntegerField()
    question_id = models.IntegerField()
    university_id = models.IntegerField()
    updated_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.degree} | Sem {self.semester} | {self.subject} ({self.year})"
    

class University(models.Model):
    name = models.CharField(max_length=200)

    def __str__(self):
        return self.name

class Degree(models.Model):
    name = models.CharField(max_length=200)
    university = models.ForeignKey(University, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.name} ({self.university.name})"

class Exam(models.Model):
    exam_name = models.CharField(max_length=255)
    exam_date = models.DateField()
    exam_url = models.URLField()
    degree_name = models.CharField(max_length=255)
    semester = models.CharField(max_length=10)
    admission_year = models.CharField(max_length=10)
    university = models.ForeignKey(University, on_delete=models.CASCADE)


class Job(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField()
    deadline = models.DateField()
    created_at = models.DateTimeField(auto_now_add=True)
    # Add any additional fields you see in your SQL table

    def __str__(self):
        return self.title

class District(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name
from django.db import models

class Initiative(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField(blank=True)
    link = models.URLField(blank=True)
    photo = models.ImageField(upload_to='initiatives/', blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

class EventCategory(models.Model):
    category = models.CharField(max_length=255)

    def __str__(self):
        return self.category

class Event(models.Model):
    name = models.CharField(max_length=255)
    event_start = models.DateTimeField()
    event_end = models.DateTimeField()
    place = models.CharField(max_length=255)
    link = models.URLField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    map_link = models.URLField(blank=True, null=True)

    district = models.ForeignKey(District, on_delete=models.SET_NULL, null=True, blank=True)
    category = models.ForeignKey(EventCategory, on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return self.name