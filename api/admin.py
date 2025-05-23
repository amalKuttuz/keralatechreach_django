from django.contrib import admin
from .models import (
    AppVersion,
    CategoryModel,
    BudgetSelection,
    ContactMessage,
    SliderItem,
    ApprovedQuestion,
    Product,
    Question
)

@admin.register(AppVersion)
class AppVersionAdmin(admin.ModelAdmin):
    list_display = ('version_name', 'version_code', 'force_update', 'created_at', 'updated_at')
    search_fields = ('version_name',)
    list_filter = ('force_update',)

@admin.register(CategoryModel)
class CategoryModelAdmin(admin.ModelAdmin):
    list_display = ('name', 'display_order', 'is_active', 'created_at')
    search_fields = ('name',)
    list_filter = ('is_active',)
    list_editable = ('display_order', 'is_active')

@admin.register(BudgetSelection)
class BudgetSelectionAdmin(admin.ModelAdmin):
    list_display = ('title', 'category', 'budget_limit', 'display_order', 'is_active', 'created_at')
    search_fields = ('title',)
    list_filter = ('category', 'is_active')
    list_editable = ('display_order', 'is_active')

@admin.register(ContactMessage)
class ContactMessageAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'subject', 'status', 'created_at')
    search_fields = ('name', 'email', 'subject', 'message')
    list_filter = ('status', 'created_at')
    readonly_fields = ('name', 'email', 'phone', 'subject', 'message', 'created_at')
    
@admin.register(SliderItem)
class SliderItemAdmin(admin.ModelAdmin):
    list_display = ('title', 'display_order', 'status', 'created_at')
    search_fields = ('title',)
    list_filter = ('status',)
    list_editable = ('display_order', 'status')

@admin.register(ApprovedQuestion)
class ApprovedQuestionAdmin(admin.ModelAdmin):
    list_display = ('degree', 'semester', 'subject', 'year', 'university', 'updated_date')
    search_fields = ('degree', 'subject')
    list_filter = ('degree', 'semester', 'year', 'university')

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('title', 'category', 'price', 'rating', 'is_active', 'created_at')
    search_fields = ('title', 'description')
    list_filter = ('category', 'is_active', 'rating')
    list_editable = ('price', 'rating', 'is_active')

@admin.register(Question)
class QuestionAdmin(admin.ModelAdmin):
    list_display = ('degree', 'subject', 'semester', 'year', 'university', 'status', 'upload_date')
    search_fields = ('subject',)
    list_filter = ('degree', 'university', 'semester', 'status')
    readonly_fields = ('upload_date',)
    list_editable = ('status',)
    actions = ['approve_questions']
    
    def approve_questions(self, request, queryset):
        """Approve selected questions and create ApprovedQuestion entries"""
        for question in queryset:
            question.status = True
            question.save()
            
            # Create approved question entry if it doesn't exist
            ApprovedQuestion.objects.update_or_create(
                question=question,
                defaults={
                    'degree': question.degree,
                    'semester': question.semester,
                    'subject': question.subject,
                    'question_text': question.file,
                    'year': int(question.year) if question.year.isdigit() else 0,
                    'university': question.university
                }
            )
        
        self.message_user(request, f"{queryset.count()} questions have been approved.")
    
    approve_questions.short_description = "Approve selected questions"
