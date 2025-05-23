from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from django.urls import path, include, re_path
from django.contrib.auth import views as auth_views
from django.views.generic import RedirectView
from .views import (
    serve_protected_file, 
    FileUploadView,
    QuestionPaperView,
    NotesView,
    bad_request,
    permission_denied,
    page_not_found,
    server_error
)

# Error handlers
handler400 = 'keralatechreach.views.bad_request'
handler403 = 'keralatechreach.views.permission_denied'
handler404 = 'keralatechreach.views.page_not_found'
handler500 = 'keralatechreach.views.server_error'

urlpatterns = [
    # Django default admin
    path('admin/', admin.site.urls),
    
    # Admin Dashboard URLs
    path('admindashboard/', include('admindashboard.urls')),
    path('', include('publicpage.urls')),  # Landing page for non-logged-in users

    # Redirect root to admin dashboard login
    # path('', RedirectView.as_view(url='/admindashboard/login/', permanent=False), name='root'),

    path('api/', include('api.urls')),
    
    # File serving endpoints
    path('media/protected/<path:file_path>', serve_protected_file, name='serve_protected_file'),
    path('api/upload/', FileUploadView.as_view(), name='file_upload'),
    path('questions/view/<int:question_id>/', QuestionPaperView.as_view(), name='view_question'),
    path('notes/view/<int:notes_id>/', NotesView.as_view(), name='view_notes'),
]

# Serve media and static files during development
if settings.DEBUG:
    # For development only - in production, use proper web server
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
else:
    # In production, serve files through the secure view
    # This ensures proper authentication and authorization
    urlpatterns += [
        re_path(r'^media/(?P<file_path>.*)$', serve_protected_file, name='serve_media')
    ]