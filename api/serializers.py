from rest_framework import serializers
from django.contrib.auth.models import User
from admindashboard.models import (
    QuestionPaper, Job, Initiative, UserProfile, Note,
    AffiliateCategory, AffiliateBudgetSelection, AffiliateSliderItem, AffiliateProduct,
    News, Gallery, Exam
)
from keralatechreach.models import (
    University, Degree, District, EventCategory, Event, EventImpression, 
    Question, ApprovedQuestion, AppVersion, Category, BudgetSelection, 
    ContactMessage, Slider, Staff, EntranceNotification, 
    NotesUpload, EventInteraction, Product
)
from .models import (
    AppVersion, 
    CategoryModel, 
    BudgetSelection, 
    SliderItem, 
    ApprovedQuestion,
    Product
)

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'first_name', 'last_name')
        read_only_fields = ('id',)

class UserProfileSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)
    
    class Meta:
        model = UserProfile
        fields = ('id', 'user', 'phone', 'district', 'profile_picture', 'bio')
        read_only_fields = ('id',)

class AppVersionSerializer(serializers.ModelSerializer):
    class Meta:
        model = AppVersion
        fields = '__all__'

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = '__all__'

class BudgetSelectionSerializer(serializers.ModelSerializer):
    category_name = serializers.CharField(source='category.name', read_only=True)
    
    class Meta:
        model = BudgetSelection
        fields = '__all__'

class ContactMessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ContactMessage
        fields = '__all__'

class SliderItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = SliderItem
        fields = ['id', 'title', 'image_url', 'redirect_url', 'display_order']

class ProductSerializer(serializers.ModelSerializer):
    category_name = serializers.CharField(source='category.name', read_only=True)
    
    class Meta:
        model = Product
        fields = '__all__'

class QuestionPaperSerializer(serializers.ModelSerializer):
    degree_name = serializers.CharField(source='degree.name', read_only=True)
    university_name = serializers.CharField(source='university_id.name', read_only=True)
    
    class Meta:
        model = QuestionPaper
        fields = ['id', 'degree', 'degree_name', 'semester', 'subject', 'file_path', 'year', 'university_id', 'university_name']

class UniversitySerializer(serializers.ModelSerializer):
    class Meta:
        model = University
        fields = '__all__'

class DegreeSerializer(serializers.ModelSerializer):
    university_name = serializers.CharField(source='university.university_name', read_only=True)
    
    class Meta:
        model = Degree
        fields = '__all__'

class ExamSerializer(serializers.ModelSerializer):
    degree_name = serializers.CharField(source='degree_name.name', read_only=True)
    university_name = serializers.CharField(source='university.name', read_only=True)
    
    class Meta:
        model = Exam
        fields = ['id', 'exam_name', 'exam_date', 'exam_url', 'degree_name', 'semester', 'admission_year', 'university', 'university_name']

class JobSerializer(serializers.ModelSerializer):
    class Meta:
        model = Job
        fields = ['id', 'title', 'description', 'last_date']

class DistrictSerializer(serializers.ModelSerializer):
    class Meta:
        model = District
        fields = '__all__'

class InitiativeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Initiative
        fields = ['id', 'name', 'description', 'link', 'photo']

class EventCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = EventCategory
        fields = '__all__'

class EventSerializer(serializers.ModelSerializer):
    category_name = serializers.CharField(source='category.category', read_only=True)
    district_name = serializers.CharField(source='district.district', read_only=True)
    
    class Meta:
        model = Event
        fields = '__all__'

class NewsSerializer(serializers.ModelSerializer):
    class Meta:
        model = News
        fields = ['id', 'title', 'slug', 'content', 'excerpt', 'image', 'thumbnail', 'created_at', 'reading_time', 'views_count']

class GallerySerializer(serializers.ModelSerializer):
    class Meta:
        model = Gallery
        fields = ['id', 'title', 'description', 'image', 'created_at']

class EntranceNotificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = EntranceNotification
        fields = '__all__'

class AffiliateCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = AffiliateCategory
        fields = ('id', 'name', 'image_url')
        read_only_fields = ('id',)

class AffiliateBudgetSelectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = AffiliateBudgetSelection
        fields = ('id', 'title', 'category', 'budget_limit', 'image_url', 'display_order')
        read_only_fields = ('id',)

class AffiliateSliderItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = AffiliateSliderItem
        fields = ('id', 'image_url', 'redirect_url', 'display_order')
        read_only_fields = ('id',)

class AffiliateProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = AffiliateProduct
        fields = ('id', 'title', 'description', 'category', 'price', 'image_url', 'affiliate_url', 'affiliate_code', 'rating')
        read_only_fields = ('id',)

class NoteSerializer(serializers.ModelSerializer):
    uploaded_by_name = serializers.CharField(source='uploaded_by.user.username', read_only=True)
    degree_name = serializers.CharField(source='degree.name', read_only=True)
    university_name = serializers.CharField(source='university.name', read_only=True)
    
    class Meta:
        model = Note
        fields = ('id', 'title', 'module', 'degree', 'degree_name', 'semester', 'year', 
                 'university', 'university_name', 'file', 'uploaded_by', 'uploaded_by_name', 
                 'uploaded_at', 'is_published')
        read_only_fields = ('id', 'uploaded_at')

class UserRegistrationSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)
    confirm_password = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = ('username', 'email', 'password', 'confirm_password', 
                 'first_name', 'last_name')

    def validate(self, data):
        if data['password'] != data['confirm_password']:
            raise serializers.ValidationError("Passwords do not match")
        return data

    def create(self, validated_data):
        validated_data.pop('confirm_password')
        user = User.objects.create_user(**validated_data)
        return user

class AnalyticsSerializer(serializers.Serializer):
    total_users = serializers.IntegerField()
    total_notes = serializers.IntegerField()
    total_question_papers = serializers.IntegerField()
    total_jobs = serializers.IntegerField()
    total_events = serializers.IntegerField()
    total_initiatives = serializers.IntegerField()

class QuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Question
        fields = '__all__'

class ApprovedQuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = ApprovedQuestion
        fields = '__all__'

class EventImpressionSerializer(serializers.ModelSerializer):
    class Meta:
        model = EventImpression
        fields = '__all__'

class NotesUploadSerializer(serializers.ModelSerializer):
    uploaded_by_name = serializers.CharField(source='uploaded_by.userid', read_only=True)
    
    class Meta:
        model = NotesUpload
        fields = '__all__'

class EventInteractionSerializer(serializers.ModelSerializer):
    event_name = serializers.CharField(source='event.name', read_only=True)
    
    class Meta:
        model = EventInteraction
        fields = '__all__'

class SliderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Slider
        fields = ['id', 'title', 'image_url', 'redirect_url', 'display_order'] 