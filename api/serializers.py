from rest_framework import serializers
from admindashboard.models import (
    QuestionPaper,
    Note,
    University,
    Degree,
    Exam,
    EntranceNotification,
    News,
    Job,
    NewsCategory,
    UserProfile,
    District,
    Event,
    EventCategory
)

# Keep the necessary imports for the auth serializers
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from django.contrib.auth import get_user_model
from django.contrib.auth.password_validation import validate_password
from django.contrib.auth.models import User # Explicitly import User if needed

# User model might be defined here or imported from django.contrib.auth
# Assuming User is correctly defined or imported elsewhere if get_user_model() is used.

# Add District Serializer
class DistrictSerializer(serializers.ModelSerializer):
    class Meta:
        model = District
        fields = ['id', 'name']

class UniversitySerializer(serializers.ModelSerializer):
    class Meta:
        model = University
        fields = ['id', 'name']

class DegreeSerializer(serializers.ModelSerializer):
    university_name = serializers.CharField(source='university.name', read_only=True)
    
    class Meta:
        model = Degree
        fields = ['id', 'name', 'university', 'university_name']

class QuestionPaperSerializer(serializers.ModelSerializer):
    degree_name = serializers.CharField(source='degree.name', read_only=True)
    university_name = serializers.CharField(source='university_id.name', read_only=True)
    
    class Meta:
        model = QuestionPaper
        fields = [
            'id', 'degree', 'degree_name', 'semester', 
            'subject', 'file_path', 'year', 
            'university_id', 'university_name', 
            'is_published'
        ]

class NoteSerializer(serializers.ModelSerializer):
    degree_name = serializers.CharField(source='degree.name', read_only=True)
    university_name = serializers.CharField(source='university.name', read_only=True)
    
    class Meta:
        model = Note
        fields = [
            'id', 'title', 'module', 'degree',
            'degree_name', 'semester', 'year',
            'university', 'university_name', 'file'
        ]

class ExamSerializer(serializers.ModelSerializer):
    degree_name = serializers.CharField(source='degree_name.name', read_only=True)
    university_name = serializers.CharField(source='university.name', read_only=True)
    
    class Meta:
        model = Exam
        fields = [
            'id', 'exam_name', 'exam_date', 'exam_url',
            'degree_name', 'semester', 'admission_year',
            'university', 'university_name', 'is_published'
        ]

class EntranceNotificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = EntranceNotification
        fields = [
            'id', 'title', 'description', 'deadline',
            'link', 'published_date', 'is_published'
        ]

class NewsCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = NewsCategory
        fields = ['id', 'name', 'slug', 'description']

class NewsSerializer(serializers.ModelSerializer):
    created_by_username = serializers.CharField(source='created_by.user.username', read_only=True)
    category = NewsCategorySerializer(read_only=True)
    category_id = serializers.PrimaryKeyRelatedField(queryset=NewsCategory.objects.all(), source='category', write_only=True, allow_null=True, required=False)

    class Meta:
        model = News
        fields = [
            'id', 'title', 'slug', 'content', 'excerpt', 'image',
            'thumbnail', 'created_at', 'updated_at', 'is_published',
            'created_by', 'created_by_username', 'meta_title', 'meta_description',
            'keywords', 'reading_time', 'views_count', 'likes_count',
            'category', 'category_id'
        ]

class JobSerializer(serializers.ModelSerializer):
    created_by_username = serializers.CharField(source='created_by.user.username', read_only=True)

    class Meta:
        model = Job
        fields = [
            'id', 'title', 'description', 'last_date', 'updated_at',
            'is_published', 'created_by', 'created_by_username'
        ]

# api/serializers/auth.py - Authentication related serializers
# Note: UserProfile and District are imported from admindashboard.models above

# Use get_user_model() if your User model is a custom one
# User = get_user_model() # Uncomment if using a custom user model and replace 'from django.contrib.auth.models import User' with this

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User # Use the appropriate User model here
        fields = ('id', 'username', 'email', 'password')
        extra_kwargs = {'password': {'write_only': True}}

    def validate_password(self, value):
        validate_password(value)
        return value

    def create(self, validated_data):
        user = User.objects.create_user(
            username=validated_data['username'],
            email=validated_data.get('email', ''),
            password=validated_data['password']
        )
        return user

class CustomTokenObtainPairSerializer(TokenObtainPairSerializer):
    # Ensure this serializer correctly includes UserProfile data if needed in the token response
    # It currently includes basic User data.
    user = UserSerializer(read_only=True) # This serializes the basic User model

    def validate(self, attrs):
        data = super().validate(attrs)
        # You might want to add UserProfile data here if it's part of your token payload
        # For example:
        # if self.user and hasattr(self.user, 'userprofile'):
        #     user_profile_serializer = UserProfileSerializer(self.user.userprofile)
        #     data['user_profile'] = user_profile_serializer.data
        data['user'] = UserSerializer(self.user).data
        return data

    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)
        token['username'] = user.username
        token['email'] = user.email
        # Add UserProfile data to token payload if needed
        # if hasattr(user, 'userprofile'):
        #     token['user_profile_id'] = user.userprofile.id
        #     token['phone'] = user.userprofile.phone # Example
        return token

# UserProfile Serializer (already added)
class UserProfileSerializer(serializers.ModelSerializer):
    username = serializers.CharField(source='user.username', read_only=True)
    email = serializers.EmailField(source='user.email', read_only=True)
    district = serializers.PrimaryKeyRelatedField(queryset=District.objects.all(), allow_null=True, required=False) # Use the imported District model

    class Meta:
        model = UserProfile
        fields = [
            'id', 'username', 'email', 'phone', 'district', 
            'profile_picture', 'bio', 'is_active', 'is_verified',
            'is_approved', 'working_status', 'course', 'university', # Add new fields
        ]
        read_only_fields = [
             'id', 'username', 'email', 'profile_picture', 'is_active', 
             'is_verified', 'is_approved' # Specify read-only fields
        ]

    # Custom update logic to handle nested User model fields if necessary
    # This might be needed if you want to allow updating email/username via the profile endpoint,
    # but the current requirement is only for phone, district, and bio on UserProfile.
    # def update(self, instance, validated_data):
    #     user_data = validated_data.pop('user', {})
    #     user = instance.user
    #     # Update UserProfile fields
    #     instance = super().update(instance, validated_data)
    #     # Update User fields (if allowed)
    #     # for attr, value in user_data.items():
    #     #     setattr(user, attr, value)
    #     # user.save()
    #     return instance

# Add EventCategory Serializer
class EventCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = EventCategory
        fields = ['id', 'category']

# Add Event Serializer
class EventSerializer(serializers.ModelSerializer):
    category = EventCategorySerializer(read_only=True) # Serialize the category details
    district = DistrictSerializer(read_only=True) # Serialize the district details

    class Meta:
        model = Event
        fields = [
            'id', 'name', 'event_start', 'event_end', 
            'place', 'link', 'description', 'map_link', 
            'district', 'category', 'is_published'
        ]