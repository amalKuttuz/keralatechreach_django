from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from keralatechreach.models import NotesUpload, User
from admindashboard.forms import NotesUploadForm
from admindashboard.views.activity_log import log_activity
from admindashboard.mixins import StaffRequiredMixin, ActivityLogMixin
import os
from django.conf import settings


class NotesUploadListView(LoginRequiredMixin, StaffRequiredMixin, ListView):
    model = NotesUpload
    template_name = 'admindashboard/notes/list.html'
    context_object_name = 'notes'
    paginate_by = 20
    
    def get_queryset(self):
        queryset = super().get_queryset()
        
        # Filter parameters
        status = self.request.GET.get('status')
        uploader = self.request.GET.get('uploader')
        
        if status:
            queryset = queryset.filter(status=(status == 'approved'))
        if uploader:
            queryset = queryset.filter(uploaded_by_id=uploader)
            
        return queryset.order_by('-uploaded_at')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Add filter options for the template
        context['uploaders'] = User.objects.filter(
            id__in=NotesUpload.objects.values_list('uploaded_by_id', flat=True).distinct()
        )
        return context


class NotesUploadCreateView(LoginRequiredMixin, StaffRequiredMixin, ActivityLogMixin, CreateView):
    model = NotesUpload
    form_class = NotesUploadForm
    template_name = 'admindashboard/notes/form.html'
    success_url = reverse_lazy('admindashboard:notes_list')
    activity_log_action = "Created notes upload"
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Add Notes'
        # Add available uploaders (users) for selection
        context['uploaders'] = User.objects.all()
        return context
    
    def form_valid(self, form):
        notes = form.save(commit=False)
        
        # Set the uploader to a default user if not selected
        if not hasattr(notes, 'uploaded_by'):
            notes.uploaded_by = User.objects.first()  # Default to first user
        
        # Handle file upload
        if 'file_path' in self.request.FILES:
            file = self.request.FILES['file_path']
            
            # Ensure the notes upload directory exists
            upload_dir = os.path.join(settings.MEDIA_ROOT, 'notes_upload')
            os.makedirs(upload_dir, exist_ok=True)
            
            # Create a filename
            filename = f"{notes.title.replace(' ', '_')}.{file.name.split('.')[-1]}"
            file_path = os.path.join(upload_dir, filename)
            
            # Save the file
            with open(file_path, 'wb+') as destination:
                for chunk in file.chunks():
                    destination.write(chunk)
            
            # Update the file_path field
            notes.file_path = os.path.join('notes_upload', filename)
        
        notes.save()
        
        self.log_message = f"Created notes upload: {notes.title}"
        messages.success(self.request, 'Notes uploaded successfully.')
        return super().form_valid(form)


class NotesUploadUpdateView(LoginRequiredMixin, StaffRequiredMixin, ActivityLogMixin, UpdateView):
    model = NotesUpload
    form_class = NotesUploadForm
    template_name = 'admindashboard/notes/form.html'
    success_url = reverse_lazy('admindashboard:notes_list')
    activity_log_action = "Updated notes upload"
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Edit Notes'
        # Add available uploaders (users) for selection
        context['uploaders'] = User.objects.all()
        return context
    
    def form_valid(self, form):
        notes = form.save(commit=False)
        
        # Handle file upload if a new file is provided
        if 'file_path' in self.request.FILES:
            # Delete old file if it exists
            if notes.file_path:
                old_file_path = os.path.join(settings.MEDIA_ROOT, str(notes.file_path))
                if os.path.exists(old_file_path):
                    os.remove(old_file_path)
            
            file = self.request.FILES['file_path']
            
            # Ensure the notes upload directory exists
            upload_dir = os.path.join(settings.MEDIA_ROOT, 'notes_upload')
            os.makedirs(upload_dir, exist_ok=True)
            
            # Create a filename
            filename = f"{notes.title.replace(' ', '_')}.{file.name.split('.')[-1]}"
            file_path = os.path.join(upload_dir, filename)
            
            # Save the file
            with open(file_path, 'wb+') as destination:
                for chunk in file.chunks():
                    destination.write(chunk)
            
            # Update the file_path field
            notes.file_path = os.path.join('notes_upload', filename)
        
        notes.save()
        
        self.log_message = f"Updated notes upload: {notes.title}"
        messages.success(self.request, 'Notes updated successfully.')
        return super().form_valid(form)


class NotesUploadDeleteView(LoginRequiredMixin, StaffRequiredMixin, ActivityLogMixin, DeleteView):
    model = NotesUpload
    template_name = 'admindashboard/notes/delete.html'
    success_url = reverse_lazy('admindashboard:notes_list')
    context_object_name = 'notes'
    activity_log_action = "Deleted notes upload"
    
    def delete(self, request, *args, **kwargs):
        notes = self.get_object()
        
        # Delete the associated file if it exists
        if notes.file_path:
            file_path = os.path.join(settings.MEDIA_ROOT, str(notes.file_path))
            if os.path.exists(file_path):
                os.remove(file_path)
        
        self.log_message = f"Deleted notes upload: {notes.title}"
        messages.success(request, 'Notes deleted successfully.')
        return super().delete(request, *args, **kwargs) 