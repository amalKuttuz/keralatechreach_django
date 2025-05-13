from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .models import (
    QuestionPaper, University, Degree, Exam, Job, District,
    Initiative, EventCategory, Event, News, ContactMessage,
    Gallery, SiteSetting, UserProfile
)
from .forms import (
    QuestionPaperForm, UniversityForm, DegreeForm, ExamForm, JobForm,
    DistrictForm, InitiativeForm, EventCategoryForm, EventForm, NewsForm,
    ContactMessageForm, GalleryForm, SiteSettingForm, UserProfileForm,
    UserRegistrationForm, UserProfileUpdateForm, UserManagementForm
)
from django.contrib.auth import login, authenticate
from django.contrib.auth.models import User
from django.db import transaction

@login_required
def dashboard(request):
    context = {
        'question_count': QuestionPaper.objects.count(),
        'exam_count': Exam.objects.count(),
        'job_count': Job.objects.count(),
        'event_count': Event.objects.count(),
        'news_count': News.objects.count(),
        'unread_messages': ContactMessage.objects.filter(is_read=False).count(),
    }
    return render(request, 'admindashboard/dashboard.html', context)

# QuestionPaper Views
@login_required
def question_list(request):
    questions = QuestionPaper.objects.all().order_by('-updated_at')
    return render(request, 'admindashboard/question_list.html', {'questions': questions})

@login_required
def question_create(request):
    if request.method == 'POST':
        form = QuestionPaperForm(request.POST, request.FILES)
        if form.is_valid():
            question = form.save(commit=False)
            question.created_by = request.user.userprofile
            question.save()
            messages.success(request, 'Question paper created successfully.')
            return redirect('question_list')
    else:
        form = QuestionPaperForm()
    return render(request, 'admindashboard/question_form.html', {'form': form})

@login_required
def question_edit(request, pk):
    question = get_object_or_404(QuestionPaper, pk=pk)
    if request.method == 'POST':
        form = QuestionPaperForm(request.POST, request.FILES, instance=question)
        if form.is_valid():
            form.save()
            messages.success(request, 'Question paper updated successfully.')
            return redirect('question_list')
    else:
        form = QuestionPaperForm(instance=question)
    return render(request, 'admindashboard/question_form.html', {'form': form})

@login_required
def question_delete(request, pk):
    question = get_object_or_404(QuestionPaper, pk=pk)
    question.delete()
    messages.success(request, 'Question paper deleted successfully.')
    return redirect('question_list')

# Event Views
@login_required
def event_list(request):
    events = Event.objects.all().order_by('-event_start')
    return render(request, 'admindashboard/event_list.html', {'events': events})

@login_required
def event_create(request):
    if request.method == 'POST':
        form = EventForm(request.POST)
        if form.is_valid():
            event = form.save(commit=False)
            event.created_by = request.user.userprofile
            event.save()
            messages.success(request, 'Event created successfully.')
            return redirect('event_list')
    else:
        form = EventForm()
    return render(request, 'admindashboard/event_form.html', {'form': form})

@login_required
def event_edit(request, pk):
    event = get_object_or_404(Event, pk=pk)
    if request.method == 'POST':
        form = EventForm(request.POST, instance=event)
        if form.is_valid():
            form.save()
            messages.success(request, 'Event updated successfully.')
            return redirect('event_list')
    else:
        form = EventForm(instance=event)
    return render(request, 'admindashboard/event_form.html', {'form': form})

@login_required
def event_delete(request, pk):
    event = get_object_or_404(Event, pk=pk)
    event.delete()
    messages.success(request, 'Event deleted successfully.')
    return redirect('event_list')

# News Views
@login_required
def news_list(request):
    news_items = News.objects.all().order_by('-created_at')
    return render(request, 'admindashboard/news_list.html', {'news_items': news_items})

@login_required
def news_create(request):
    if request.method == 'POST':
        form = NewsForm(request.POST, request.FILES)
        if form.is_valid():
            news = form.save(commit=False)
            news.created_by = request.user.userprofile
            news.save()
            messages.success(request, 'News created successfully.')
            return redirect('news_list')
    else:
        form = NewsForm()
    return render(request, 'admindashboard/news_form.html', {'form': form})

@login_required
def news_edit(request, pk):
    news = get_object_or_404(News, pk=pk)
    if request.method == 'POST':
        form = NewsForm(request.POST, request.FILES, instance=news)
        if form.is_valid():
            form.save()
            messages.success(request, 'News updated successfully.')
            return redirect('news_list')
    else:
        form = NewsForm(instance=news)
    return render(request, 'admindashboard/news_form.html', {'form': form})

@login_required
def news_delete(request, pk):
    news = get_object_or_404(News, pk=pk)
    news.delete()
    messages.success(request, 'News deleted successfully.')
    return redirect('news_list')

# Job Views
@login_required
def job_list(request):
    jobs = Job.objects.all().order_by('-updated_at')
    return render(request, 'admindashboard/job_list.html', {'jobs': jobs})

@login_required
def job_create(request):
    if request.method == 'POST':
        form = JobForm(request.POST)
        if form.is_valid():
            job = form.save(commit=False)
            job.created_by = request.user.userprofile
            job.save()
            messages.success(request, 'Job created successfully.')
            return redirect('job_list')
    else:
        form = JobForm()
    return render(request, 'admindashboard/job_form.html', {'form': form})

@login_required
def job_edit(request, pk):
    job = get_object_or_404(Job, pk=pk)
    if request.method == 'POST':
        form = JobForm(request.POST, instance=job)
        if form.is_valid():
            form.save()
            messages.success(request, 'Job updated successfully.')
            return redirect('job_list')
    else:
        form = JobForm(instance=job)
    return render(request, 'admindashboard/job_form.html', {'form': form})

@login_required
def job_delete(request, pk):
    job = get_object_or_404(Job, pk=pk)
    job.delete()
    messages.success(request, 'Job deleted successfully.')
    return redirect('job_list')

# Contact Message Views
@login_required
def contact_list(request):
    messages = ContactMessage.objects.all().order_by('-created_at')
    return render(request, 'admindashboard/contact_list.html', {'messages': messages})

@login_required
def contact_detail(request, pk):
    message = get_object_or_404(ContactMessage, pk=pk)
    if not message.is_read:
        message.is_read = True
        message.save()
    return render(request, 'admindashboard/contact_detail.html', {'message': message})

@login_required
def contact_delete(request, pk):
    message = get_object_or_404(ContactMessage, pk=pk)
    message.delete()
    messages.success(request, 'Message deleted successfully.')
    return redirect('contact_list')

# Gallery Views
@login_required
def gallery_list(request):
    gallery_items = Gallery.objects.all().order_by('-created_at')
    return render(request, 'admindashboard/gallery_list.html', {'gallery_items': gallery_items})

@login_required
def gallery_create(request):
    if request.method == 'POST':
        form = GalleryForm(request.POST, request.FILES)
        if form.is_valid():
            gallery = form.save(commit=False)
            gallery.created_by = request.user.userprofile
            gallery.save()
            messages.success(request, 'Gallery item created successfully.')
            return redirect('gallery_list')
    else:
        form = GalleryForm()
    return render(request, 'admindashboard/gallery_form.html', {'form': form})

@login_required
def gallery_edit(request, pk):
    gallery = get_object_or_404(Gallery, pk=pk)
    if request.method == 'POST':
        form = GalleryForm(request.POST, request.FILES, instance=gallery)
        if form.is_valid():
            form.save()
            messages.success(request, 'Gallery item updated successfully.')
            return redirect('gallery_list')
    else:
        form = GalleryForm(instance=gallery)
    return render(request, 'admindashboard/gallery_form.html', {'form': form})

@login_required
def gallery_delete(request, pk):
    gallery = get_object_or_404(Gallery, pk=pk)
    gallery.delete()
    messages.success(request, 'Gallery item deleted successfully.')
    return redirect('gallery_list')

def register(request):
    if request.method == 'POST':
        form = UserRegistrationForm(request.POST)
        if form.is_valid():
            with transaction.atomic():
                user = form.save()
                # Create UserProfile
                UserProfile.objects.create(
                    user=user,
                    email=form.cleaned_data['email'],
                    created_by=request.user.userprofile if request.user.is_authenticated else None
                )
                messages.success(request, 'Registration successful. Please log in.')
                return redirect('admindashboard:login')
    else:
        form = UserRegistrationForm()
    return render(request, 'admindashboard/register.html', {'form': form})

@login_required
def profile(request):
    if request.method == 'POST':
        user_form = UserProfileUpdateForm(request.POST, instance=request.user)
        profile_form = UserProfileForm(request.POST, request.FILES, instance=request.user.userprofile)
        if user_form.is_valid() and profile_form.is_valid():
            user_form.save()
            profile_form.save()
            messages.success(request, 'Your profile has been updated successfully.')
            return redirect('admindashboard:profile')
    else:
        user_form = UserProfileUpdateForm(instance=request.user)
        profile_form = UserProfileForm(instance=request.user.userprofile)
    
    context = {
        'user_form': user_form,
        'profile_form': profile_form
    }
    return render(request, 'admindashboard/profile.html', context)

@login_required
def user_list(request):
    if not request.user.is_staff:
        messages.error(request, 'You do not have permission to access this page.')
        return redirect('admindashboard:dashboard')
    
    users = UserProfile.objects.select_related('user').all().order_by('-created_at')
    return render(request, 'admindashboard/user_list.html', {'users': users})

@login_required
def user_detail(request, pk):
    if not request.user.is_staff:
        messages.error(request, 'You do not have permission to access this page.')
        return redirect('admindashboard:dashboard')
    
    user_profile = get_object_or_404(UserProfile, pk=pk)
    if request.method == 'POST':
        form = UserManagementForm(request.POST, instance=user_profile)
        if form.is_valid():
            form.save()
            messages.success(request, f'User {user_profile.user.username} has been updated successfully.')
            return redirect('admindashboard:user_list')
    else:
        form = UserManagementForm(instance=user_profile)
    
    context = {
        'user_profile': user_profile,
        'form': form
    }
    return render(request, 'admindashboard/user_detail.html', context)

@login_required
def user_delete(request, pk):
    if not request.user.is_staff:
        messages.error(request, 'You do not have permission to access this page.')
        return redirect('admindashboard:dashboard')
    
    user_profile = get_object_or_404(UserProfile, pk=pk)
    user = user_profile.user
    
    if request.method == 'POST':
        user.delete()  # This will also delete the associated UserProfile due to CASCADE
        messages.success(request, f'User {user.username} has been deleted successfully.')
        return redirect('admindashboard:user_list')
    
    return render(request, 'admindashboard/user_confirm_delete.html', {'user_profile': user_profile})

@login_required
def tables(request):
    context = {
        'questions': QuestionPaper.objects.all().order_by('-updated_at')[:10],
        'events': Event.objects.all().order_by('-event_start')[:10],
        'jobs': Job.objects.all().order_by('-updated_at')[:10],
        'news': News.objects.all().order_by('-created_at')[:10],
        'users': UserProfile.objects.all().order_by('-created_at')[:10],
    }
    return render(request, 'admindashboard/tables.html', context)
