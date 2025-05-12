from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from django.urls import path
from api import views
from admindashboard import views
from django.urls import include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('api.urls')), 
    path('dashboard/', include('admindashboard.urls')),  # 👈 this line maps admindashboard URLs

]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)