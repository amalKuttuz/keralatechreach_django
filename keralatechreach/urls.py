from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from django.urls import path, include
from django.contrib.auth import views as auth_views

urlpatterns = [
    # Django default admin
    path('admin/', admin.site.urls),
    
    # API URLs
    path('api/', include('api.urls')),
    
    # Admin Dashboard URLs
    path('admindashboard/', include('admindashboard.urls')),
    
    # Redirect root to admin dashboard login
    path('', auth_views.RedirectView.as_view(url='/admindashboard/login/', permanent=False), name='root'),
]

# Serve media and static files during development
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)