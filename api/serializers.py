from rest_framework import serializers
from django.contrib.auth.models import User
from admindashboard.models import (
    QuestionPaper, Job, Event, Initiative, UserProfile, Note, ContactMessage, EntranceNotification,
    AffiliateCategory, AffiliateBudgetSelection, AffiliateSliderItem, AffiliateProduct
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

class QuestionPaperSerializer(serializers.ModelSerializer):
    class Meta:
        model = QuestionPaper
        fields = ('id', 'degree', 'semester', 'subject', 'file_path', 'year', 
                 'university_id', 'is_published', 'updated_at')
        read_only_fields = ('id', 'updated_at')

class JobSerializer(serializers.ModelSerializer):
    class Meta:
        model = Job
        fields = ('id', 'title', 'description', 'last_date', 'updated_at', 'is_published')
        read_only_fields = ('id', 'updated_at')

class EventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = ('id', 'name', 'event_start', 'event_end', 'place', 'link', 
                 'description', 'map_link', 'district', 'category', 'is_published', 
                 'updated_at')
        read_only_fields = ('id', 'updated_at')

class InitiativeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Initiative
        fields = ('id', 'name', 'description', 'link', 'photo', 'is_published', 
                 'updated_at')
        read_only_fields = ('id', 'updated_at')

class NoteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Note
        fields = ('id', 'title', 'module', 'degree', 'semester', 'year',
                  'university', 'file', 'uploaded_by', 'uploaded_at', 'is_published')
        read_only_fields = ('id', 'uploaded_by', 'uploaded_at', 'is_published')

class ContactMessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ContactMessage
        fields = ('id', 'name', 'email', 'subject', 'message')
        read_only_fields = ('id',)

class EntranceNotificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = EntranceNotification
        fields = ('id', 'title', 'description', 'deadline', 'link', 'published_date', 'is_published', 'created_by')
        read_only_fields = ('id', 'published_date', 'is_published', 'created_by')

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