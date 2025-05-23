from django.contrib import admin
from .models import (
    University, Degree, District, EventCategory, Event, EventImpression, 
    Question, ApprovedQuestion, AppVersion, Category, BudgetSelection, 
    ContactMessage, Slider, Staff, User, EntranceNotification, 
    NotesUpload, EventInteraction, Product
)

@admin.register(University)
class UniversityAdmin(admin.ModelAdmin):
    list_display = ('id', 'university_name', 'updated_date')
    search_fields = ('university_name',)


@admin.register(Degree)
class DegreeAdmin(admin.ModelAdmin):
    list_display = ('id', 'degree_name', 'university', 'updated_date')
    list_filter = ('university',)
    search_fields = ('degree_name',)


@admin.register(District)
class DistrictAdmin(admin.ModelAdmin):
    list_display = ('district_id', 'district', 'name', 'is_active', 'created_by', 'created_at')
    list_filter = ('is_active',)
    search_fields = ('district', 'name')
    list_editable = ('is_active',)


@admin.register(EventCategory)
class EventCategoryAdmin(admin.ModelAdmin):
    list_display = ('category_id', 'category', 'created_at')
    search_fields = ('category',)


@admin.register(Event)
class EventAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'place', 'event_start', 'event_end', 'is_sponsored')
    list_filter = ('category', 'district', 'is_sponsored')
    search_fields = ('name', 'place', 'description')


@admin.register(EventImpression)
class EventImpressionAdmin(admin.ModelAdmin):
    list_display = ('id', 'event', 'user_id', 'timestamp', 'source')
    list_filter = ('source',)


@admin.register(Question)
class QuestionAdmin(admin.ModelAdmin):
    list_display = ('id', 'deg', 'subj', 'sem', 'qyear', 'status', 'upload_date')
    list_filter = ('status', 'deg', 'sem')
    search_fields = ('deg', 'subj')


@admin.register(ApprovedQuestion)
class ApprovedQuestionAdmin(admin.ModelAdmin):
    list_display = ('approved_id', 'deg', 'subj', 'sem', 'qyear', 'updated_date')
    list_filter = ('deg', 'sem')
    search_fields = ('deg', 'subj')


@admin.register(AppVersion)
class AppVersionAdmin(admin.ModelAdmin):
    list_display = ('id', 'version_name', 'version_code', 'is_active', 'is_mandatory', 'created_at')
    list_filter = ('is_active', 'is_mandatory')


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'display_order', 'status', 'created_at')
    list_filter = ('status',)
    search_fields = ('name',)


@admin.register(BudgetSelection)
class BudgetSelectionAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'category', 'budget_limit', 'display_order', 'status')
    list_filter = ('category', 'status')
    search_fields = ('title',)


@admin.register(ContactMessage)
class ContactMessageAdmin(admin.ModelAdmin):
    list_display = ('message_id', 'name', 'email', 'subject', 'status', 'created_at')
    list_filter = ('status',)
    search_fields = ('name', 'email', 'subject', 'message')


@admin.register(Slider)
class SliderAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'display_order', 'status', 'created_at')
    list_filter = ('status',)
    search_fields = ('title',)


@admin.register(Staff)
class StaffAdmin(admin.ModelAdmin):
    list_display = ('id', 'username')
    search_fields = ('username',)


@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = ('id', 'userid')
    search_fields = ('userid',)


@admin.register(EntranceNotification)
class EntranceNotificationAdmin(admin.ModelAdmin):
    list_display = ('id', 'entrance_name', 'category', 'deadline_date', 'created_at')
    list_filter = ('category',)
    search_fields = ('entrance_name',)


@admin.register(NotesUpload)
class NotesUploadAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'uploaded_by', 'status', 'uploaded_at')
    list_filter = ('status',)
    search_fields = ('title', 'description')


@admin.register(EventInteraction)
class EventInteractionAdmin(admin.ModelAdmin):
    list_display = ('id', 'event', 'user_id', 'interaction_type', 'timestamp')
    list_filter = ('interaction_type',)


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'category', 'price', 'is_featured', 'status')
    list_filter = ('category', 'is_featured', 'status')
    search_fields = ('name', 'description') 