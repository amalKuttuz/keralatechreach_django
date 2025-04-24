# api/serializers.py

from rest_framework import serializers
from .models import ApprovedQuestionPaper,University,Degree,Exam,Job

class ApprovedQuestionPaperSerializer(serializers.ModelSerializer):
    class Meta:
        model = ApprovedQuestionPaper
        fields = ['id', 'year', 'file_path', 'subject']

class UniversitySerializer(serializers.ModelSerializer):
    class Meta:
        model = University
        fields = ['id', 'name']

class DegreeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Degree
        fields = ['name']

class ExamSerializer(serializers.ModelSerializer):
    class Meta:
        model = Exam
        fields = [
            'id', 'exam_name', 'exam_date', 'exam_url',
            'degree_name', 'semester', 'admission_year', 'university'
        ]


class JobSerializer(serializers.ModelSerializer):
    class Meta:
        model = Job
        fields = '__all__'


from rest_framework import serializers
from .models import District

class DistrictSerializer(serializers.ModelSerializer):
    class Meta:
        model = District
        fields = ['id', 'name']
from rest_framework import serializers
from .models import Event, District, EventCategory


class EventCategorySerializer(serializers.ModelSerializer):
    category_name = serializers.CharField(source='category')

    class Meta:
        model = EventCategory
        fields = ['category_id', 'category_name', 'created_at']


class DistrictSerializer(serializers.ModelSerializer):
    district_name = serializers.CharField(source='district')

    class Meta:
        model = District
        fields = ['district_id', 'district_name', 'created_at']


class EventSerializer(serializers.ModelSerializer):
    category_name = serializers.CharField(source='category.category', read_only=True)
    district_name = serializers.CharField(source='district.district', read_only=True)

    class Meta:
        model = Event
        fields = [
            'id', 'category_id', 'district_id', 'event_start', 'event_end',
            'name', 'place', 'link', 'map_link', 'created_at', 'description',
            'category_name', 'district_name'
        ]
from rest_framework import serializers
from .models import Initiative

class InitiativeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Initiative
        fields = ['id', 'name', 'description', 'link', 'photo']
