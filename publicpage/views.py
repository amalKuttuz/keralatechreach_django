from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.utils import timezone
from datetime import timedelta
from django.contrib import messages
from django.db.models import Q
from django.core.paginator import Paginator
from django.utils.text import slugify
from itertools import chain

from django.contrib.auth import get_user_model
from admindashboard.models import News, Event, QuestionPaper, Testimonial, FAQ, Initiative, Exam, EntranceNotification # Import FAQ model
from .forms import NewsletterSignupForm # Import the newsletter form
from .models import NewsletterSubscriber # Import the newsletter model

User = get_user_model() # Get the custom user model

def home(request):
    if request.user.is_authenticated:
        return redirect('admindashboard:dashboard')
    
    newsletter_form = NewsletterSignupForm() # Instantiate the form
    
    now = timezone.now()
    
    context = {
        'newsletter_form': newsletter_form, # Add form to context
        # Get latest published events
        'upcoming_events': Event.objects.filter(
            event_start__gte=now,
            is_published=True
        ).order_by('event_start')[:3],
        
        # Get latest published news
        'latest_news': News.objects.filter(
            is_published=True
        ).order_by('-created_at')[:3],
        
        # Get published initiatives
        'initiatives': Initiative.objects.filter(
            is_published=True
        ).order_by('-updated_at')[:2],
        
        # Get latest exams and notifications
        'latest_exams': Exam.objects.filter(
            is_published=True,
            exam_date__gte=now
        ).order_by('exam_date')[:4],
        
        'entrance_notifications': EntranceNotification.objects.filter(
            is_published=True,
            deadline__gte=now
        ).order_by('deadline')[:4],
        
        # Get testimonials and FAQs
        'testimonials': Testimonial.objects.filter(
            is_approved=True
        ).order_by('-created_at')[:3],
        
        'faqs': FAQ.objects.filter(
            is_published=True
        ).order_by('display_order')[:5],
    }

    return render(request, 'publicpage/home.html', context)

def newsletter_signup(request):
    if request.method == 'POST':
        form = NewsletterSignupForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Thank you for subscribing to our newsletter!')
        else:
            for error in form.errors.values():
                messages.error(request, error[0])
    return redirect('publicpage:home')

# Detail views for public pages
def news_detail(request, slug):
    news_article = get_object_or_404(News, slug=slug, is_published=True)
    
    # Get keywords from the current article
    keywords = [kw.strip() for kw in news_article.keywords.split(',')] if news_article.keywords else []
    
    # Get related articles based on keywords
    related_by_keywords = News.objects.filter(
        is_published=True,
        keywords__icontains=keywords[0] if keywords else ''
    ).exclude(slug=slug)[:3] if keywords else News.objects.none()
    
    # Get articles with similar titles
    title_words = set(word.lower() for word in news_article.title.split() if len(word) > 3)
    title_queries = [Q(title__icontains=word) for word in title_words]
    
    if title_queries:
        query = title_queries.pop()
        for item in title_queries:
            query |= item
        related_by_title = News.objects.filter(
            query,
            is_published=True
        ).exclude(slug=slug)[:3]
    else:
        related_by_title = News.objects.none()
    
    # Get latest articles if we don't have enough related articles
    latest_articles = News.objects.filter(
        is_published=True
    ).exclude(
        slug=slug
    ).exclude(
        id__in=[article.id for article in chain(related_by_keywords, related_by_title)]
    ).order_by('-created_at')[:3]
    
    # Combine and deduplicate related articles
    related_news = list(chain(related_by_keywords, related_by_title, latest_articles))
    seen = set()
    related_news = [article for article in related_news if article.id not in seen and not seen.add(article.id)][:3]
    
    context = {
        'news_article': news_article,
        'related_news': related_news,
    }
    
    return render(request, 'publicpage/news_detail.html', context)

def event_detail(request, pk):
    event = get_object_or_404(Event, pk=pk, is_published=True)
    return render(request, 'publicpage/event_detail.html', {'event': event})

def questionpaper_detail(request, pk):
    question_paper = get_object_or_404(QuestionPaper, pk=pk, is_published=True)
    return render(request, 'publicpage/questionpaper_detail.html', {'question_paper': question_paper})

def search(request):
    query = request.GET.get('q', '')
    now = timezone.now()
    
    if query:
        # Search in multiple models
        events = Event.objects.filter(
            Q(name__icontains=query) | Q(description__icontains=query),
            is_published=True,
            event_start__gte=now
        ).order_by('event_start')

        news = News.objects.filter(
            Q(title__icontains=query) | Q(content__icontains=query),
            is_published=True
        ).order_by('-created_at')

        exams = Exam.objects.filter(
            Q(exam_name__icontains=query) | Q(degree_name__name__icontains=query),
            is_published=True,
            exam_date__gte=now
        ).order_by('exam_date')

        initiatives = Initiative.objects.filter(
            Q(name__icontains=query) | Q(description__icontains=query),
            is_published=True
        ).order_by('-updated_at')

        entrance_notifications = EntranceNotification.objects.filter(
            Q(title__icontains=query) | Q(description__icontains=query),
            is_published=True,
            deadline__gte=now
        ).order_by('deadline')

    else:
        events = Event.objects.none()
        news = News.objects.none()
        exams = Exam.objects.none()
        initiatives = Initiative.objects.none()
        entrance_notifications = EntranceNotification.objects.none()

    context = {
        'query': query,
        'events': events[:5],
        'news': news[:5],
        'exams': exams[:5],
        'initiatives': initiatives[:5],
        'entrance_notifications': entrance_notifications[:5],
        'total_results': len(events) + len(news) + len(exams) + len(initiatives) + len(entrance_notifications)
    }

    return render(request, 'publicpage/search_results.html', context)

def events_list(request):
    now = timezone.now()
    
    # Get all upcoming published events
    events = Event.objects.filter(
        event_start__gte=now,
        is_published=True
    ).order_by('event_start')
    
    # Add pagination
    paginator = Paginator(events, 10)  # Show 10 events per page
    page = request.GET.get('page')
    events_page = paginator.get_page(page)
    
    # Group events by month for the calendar view
    events_by_month = {}
    for event in events:
        month_key = event.event_start.strftime('%B %Y')
        if month_key not in events_by_month:
            events_by_month[month_key] = []
        events_by_month[month_key].append(event)
    
    context = {
        'events': events_page,
        'events_by_month': events_by_month,
    }
    
    return render(request, 'publicpage/events_list.html', context)

def news_list(request):
    news_articles = News.objects.filter(
        is_published=True
    ).order_by('-created_at')
    
    context = {
        'news_articles': news_articles,
    }
    return render(request, 'publicpage/news_list.html', context)