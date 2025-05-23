from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, FormView
from django.urls import reverse_lazy
from keralatechreach.models import Question, ApprovedQuestion
from admindashboard.forms import QuestionForm, ApprovedQuestionForm
from admindashboard.views.activity_log import log_activity
from admindashboard.mixins import StaffRequiredMixin, ActivityLogMixin
import os
from django.conf import settings
from django.http import HttpResponseRedirect


class QuestionListView(LoginRequiredMixin, StaffRequiredMixin, ListView):
    model = Question
    template_name = 'admindashboard/questions/list.html'
    context_object_name = 'questions'
    paginate_by = 20
    
    def get_queryset(self):
        queryset = super().get_queryset()
        
        # Filter parameters
        status = self.request.GET.get('status')
        university = self.request.GET.get('university')
        degree = self.request.GET.get('deg')
        semester = self.request.GET.get('sem')
        
        if status:
            queryset = queryset.filter(status=(status == 'approved'))
        if university:
            queryset = queryset.filter(university=university)
        if degree:
            queryset = queryset.filter(deg=degree)
        if semester:
            queryset = queryset.filter(sem=semester)
            
        return queryset.order_by('-upload_date')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Add filter options for the template
        context['universities'] = set(Question.objects.values_list('university', flat=True).distinct())
        context['degrees'] = set(Question.objects.values_list('deg', flat=True).distinct())
        context['semesters'] = set(Question.objects.values_list('sem', flat=True).distinct())
        return context


class QuestionCreateView(LoginRequiredMixin, StaffRequiredMixin, ActivityLogMixin, CreateView):
    model = Question
    form_class = QuestionForm
    template_name = 'admindashboard/questions/form.html'
    success_url = reverse_lazy('admindashboard:question_list')
    activity_log_action = "Created question"
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Add Question'
        return context
    
    def form_valid(self, form):
        question = form.save(commit=False)
        
        # Handle file upload
        if 'file' in self.request.FILES:
            file = self.request.FILES['file']
            # Save the file to the media directory
            upload_dir = os.path.join(settings.MEDIA_ROOT, 'questions')
            os.makedirs(upload_dir, exist_ok=True)
            
            # Create a filename based on question details
            filename = f"{question.deg}_{question.sem}_{question.subj}_{question.qyear}.pdf"
            file_path = os.path.join(upload_dir, filename)
            
            # Save the file
            with open(file_path, 'wb+') as destination:
                for chunk in file.chunks():
                    destination.write(chunk)
            
            # Update the file field with the relative path
            question.file = os.path.join('questions', filename)
        
        question.save()
        
        self.log_message = f"Created question for {question.deg} - {question.subj} - Sem {question.sem}"
        messages.success(self.request, 'Question created successfully.')
        return super().form_valid(form)


class QuestionUpdateView(LoginRequiredMixin, StaffRequiredMixin, ActivityLogMixin, UpdateView):
    model = Question
    form_class = QuestionForm
    template_name = 'admindashboard/questions/form.html'
    success_url = reverse_lazy('admindashboard:question_list')
    activity_log_action = "Updated question"
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Edit Question'
        return context
    
    def form_valid(self, form):
        question = form.save(commit=False)
        
        # Handle file upload if a new file is provided
        if 'file' in self.request.FILES:
            # Delete old file if it exists
            old_file_path = os.path.join(settings.MEDIA_ROOT, question.file)
            if os.path.exists(old_file_path):
                os.remove(old_file_path)
            
            file = self.request.FILES['file']
            # Save the file to the media directory
            upload_dir = os.path.join(settings.MEDIA_ROOT, 'questions')
            os.makedirs(upload_dir, exist_ok=True)
            
            # Create a filename based on question details
            filename = f"{question.deg}_{question.sem}_{question.subj}_{question.qyear}.pdf"
            file_path = os.path.join(upload_dir, filename)
            
            # Save the file
            with open(file_path, 'wb+') as destination:
                for chunk in file.chunks():
                    destination.write(chunk)
            
            # Update the file field with the relative path
            question.file = os.path.join('questions', filename)
        
        question.save()
        
        self.log_message = f"Updated question for {question.deg} - {question.subj} - Sem {question.sem}"
        messages.success(self.request, 'Question updated successfully.')
        return super().form_valid(form)


class QuestionDeleteView(LoginRequiredMixin, StaffRequiredMixin, ActivityLogMixin, DeleteView):
    model = Question
    template_name = 'admindashboard/questions/delete.html'
    success_url = reverse_lazy('admindashboard:question_list')
    context_object_name = 'question'
    activity_log_action = "Deleted question"
    
    def delete(self, request, *args, **kwargs):
        question = self.get_object()
        
        # Delete the associated file if it exists
        if question.file:
            file_path = os.path.join(settings.MEDIA_ROOT, question.file)
            if os.path.exists(file_path):
                os.remove(file_path)
        
        self.log_message = f"Deleted question for {question.deg} - {question.subj} - Sem {question.sem}"
        messages.success(request, 'Question deleted successfully.')
        return super().delete(request, *args, **kwargs)


class QuestionApproveView(LoginRequiredMixin, StaffRequiredMixin, ActivityLogMixin, FormView):
    template_name = 'admindashboard/questions/approve.html'
    form_class = ApprovedQuestionForm
    success_url = reverse_lazy('admindashboard:question_list')
    activity_log_action = "Approved question"
    
    def get_initial(self):
        """Pre-fill the form with data from the question to be approved"""
        question_id = self.kwargs.get('pk')
        question = get_object_or_404(Question, pk=question_id)
        return {
            'deg': question.deg,
            'sem': question.sem,
            'subj': question.subj,
            'qtext': question.file,
            'qyear': question.qyear,
            'q_id': question.id,
            'university': question.university
        }
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        question_id = self.kwargs.get('pk')
        context['question'] = get_object_or_404(Question, pk=question_id)
        context['title'] = 'Approve Question'
        return context
    
    def form_valid(self, form):
        # Save the approved question
        approved_question = form.save()
        
        # Update the original question's status
        question_id = self.kwargs.get('pk')
        question = get_object_or_404(Question, pk=question_id)
        question.status = True
        question.save()
        
        self.log_message = f"Approved question for {approved_question.deg} - {approved_question.subj} - Sem {approved_question.sem}"
        messages.success(self.request, 'Question approved successfully.')
        return HttpResponseRedirect(self.get_success_url()) 