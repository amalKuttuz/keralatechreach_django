from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from django.urls import path
from api import views

from django.urls import include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('api.urls')),  # Your APIs
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)