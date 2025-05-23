from django.urls import path, include
from rest_framework.routers import DefaultRouter
from . import views
from rest_framework_simplejwt.views import TokenRefreshView
from .views import CustomTokenObtainPairView, TokenVerifyWithLegacyView

router = DefaultRouter()
router.register(r'universities', views.UniversityViewSet, basename='university')
router.register(r'degrees', views.DegreeViewSet, basename='degree')
router.register(r'districts', views.DistrictViewSet, basename='district')
router.register(r'event-categories', views.EventCategoryViewSet, basename='event-category')
router.register(r'events', views.EventViewSet, basename='event')
router.register(r'questions', views.QuestionViewSet, basename='question')
router.register(r'approved-questions', views.ApprovedQuestionViewSet, basename='approved-question')
router.register(r'categories', views.CategoryViewSet, basename='category')
router.register(r'budget-selections', views.BudgetSelectionViewSet, basename='budget-selection')
router.register(r'sliders', views.SliderViewSet, basename='slider')
router.register(r'entrance-notifications', views.EntranceNotificationViewSet, basename='entrance-notification')
router.register(r'notes', views.NotesUploadViewSet, basename='notes')
router.register(r'products', views.ProductViewSet, basename='product')

urlpatterns = [
    path('', include(router.urls)),
    path('app-version/', views.AppVersionView.as_view(), name='app-version'),
    path('contact/', views.ContactMessageCreateView.as_view(), name='contact'),
    path('event-impression/', views.RecordEventImpression.as_view(), name='event-impression'),
    path('event-interaction/', views.RecordEventInteraction.as_view(), name='event-interaction'),
    
    # Authentication endpoints
    path('token/', CustomTokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('auth/login/', TokenVerifyWithLegacyView.as_view(), name='auth_login_legacy'),
    
    # Universities & Degrees
    path('universities/', views.UniversityListView.as_view(), name='university-list'),
    path('universities/<int:pk>/', views.UniversityDetailView.as_view(), name='university-detail'),
    path('degrees/', views.DegreeListView.as_view(), name='degree-list'),
    path('degrees/<int:pk>/', views.DegreeDetailView.as_view(), name='degree-detail'),
    path('universities/<int:university_id>/degrees/', views.UniversityDegreesView.as_view(), name='university-degrees'),
    
    # Events
    path('events/', views.EventListView.as_view(), name='event-list'),
    path('events/<int:pk>/', views.EventDetailView.as_view(), name='event-detail'),
    path('event-categories/', views.EventCategoryListView.as_view(), name='event-category-list'),
    path('districts/', views.DistrictListView.as_view(), name='district-list'),
    
    # News & Gallery
    path('news/', views.NewsListView.as_view(), name='news-list'),
    path('news/<int:pk>/', views.NewsDetailView.as_view(), name='news-detail'),
    path('news/by-slug/<str:slug>/', views.NewsBySlugView.as_view(), name='news-by-slug'),
    path('gallery/', views.GalleryListView.as_view(), name='gallery-list'),
    
    # Exams & Jobs
    path('exams/', views.ExamListView.as_view(), name='exam-list'),
    path('exams/<int:pk>/', views.ExamDetailView.as_view(), name='exam-detail'),
    path('jobs/', views.JobListView.as_view(), name='job-list'),
    path('jobs/<int:pk>/', views.JobDetailView.as_view(), name='job-detail'),
    
    # Contact & Initiatives
    path('initiatives/', views.InitiativeListView.as_view(), name='initiative-list'),
    
    # Entrance Notifications
    path('entrance-notifications/', views.EntranceNotificationListView.as_view(), name='entrance-notifications-list'),
    
    # Question Papers
    path('questions/by-degree/<int:degree_id>/<int:semester>/', views.QuestionsByDegreeView.as_view(), name='questions-by-degree'),
    path('question-papers/', views.QuestionPaperListView.as_view(), name='question-paper-list'),
    path('question-papers/<int:pk>/', views.QuestionPaperDetailView.as_view(), name='question-paper-detail'),
] 