from django.contrib.auth import views as auth_views
from django.urls import path, include
from admindashboard import views

urlpatterns = [
path('admin/login/', auth_views.LoginView.as_view(template_name='admindashboard/login.html'), name='login'),
path('admin/logout/', auth_views.LogoutView.as_view(), name='logout'),
path('admin/dashboard/', views.dashboard, name='dashboard'),
path('questions/', views.question_list, name='question_list'),
path('questions/create/', views.question_create, name='question_create'),
path('questions/int:pk/edit/', views.question_edit, name='question_edit'),
path('questions/int:pk/delete/', views.question_delete, name='question_delete'),
path('admin/', include('admindashboard.urls')),


# repeat for Event, Contact, Job
]