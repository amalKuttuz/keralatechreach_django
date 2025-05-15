from django.urls import path, include
from rest_framework.routers import DefaultRouter
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)
from . import views

router = DefaultRouter()
router.register(r'auth', views.AuthViewSet, basename='auth')
router.register(r'questions', views.QuestionPaperViewSet, basename='question')
router.register(r'jobs', views.JobViewSet, basename='job')
router.register(r'events', views.EventViewSet, basename='event')
router.register(r'initiatives', views.InitiativeViewSet, basename='initiative')
router.register(r'profile', views.UserProfileViewSet, basename='profile')
router.register(r'notes', views.NoteViewSet, basename='note')
router.register(r'entrance-notifications', views.EntranceNotificationViewSet, basename='entrance-notification')

urlpatterns = [
    path('', include(router.urls)),
    path('token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    # URL for contact message submission (handled by ContactMessageAPIView which is not a ViewSet)
    path('contact/submit/', views.ContactMessageAPIView.as_view(), name='contact_message_submit'),
    # URL for contact message status checking
    path('contact/status/<int:message_id>/', views.ContactMessageStatusAPIView.as_view(), name='contact_message_status'),
    path('analytics/', views.AnalyticsAPIView.as_view(), name='analytics'),
    path('version-check/', views.VersionCheckAPIView.as_view(), name='version_check'),
] 