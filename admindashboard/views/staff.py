from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from keralatechreach.models import Staff
from admindashboard.forms import StaffForm
from admindashboard.views.activity_log import log_activity
from admindashboard.mixins import StaffRequiredMixin, ActivityLogMixin
import bcrypt


class StaffListView(LoginRequiredMixin, StaffRequiredMixin, ListView):
    model = Staff
    template_name = 'admindashboard/staff/list.html'
    context_object_name = 'staff_members'
    paginate_by = 10


class StaffCreateView(LoginRequiredMixin, StaffRequiredMixin, ActivityLogMixin, CreateView):
    model = Staff
    form_class = StaffForm
    template_name = 'admindashboard/staff/form.html'
    success_url = reverse_lazy('admindashboard:staff_list')
    activity_log_action = "Created staff member"
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Add Staff Member'
        return context
    
    def form_valid(self, form):
        staff = form.save(commit=False)
        # Hash the password using bcrypt
        password = form.cleaned_data['password'].encode('utf-8')
        hashed_password = bcrypt.hashpw(password, bcrypt.gensalt())
        staff.password = hashed_password.decode('utf-8')
        staff.save()
        
        self.log_message = f"Created staff member: {staff.username}"
        messages.success(self.request, 'Staff member created successfully.')
        return super().form_valid(form)


class StaffUpdateView(LoginRequiredMixin, StaffRequiredMixin, ActivityLogMixin, UpdateView):
    model = Staff
    form_class = StaffForm
    template_name = 'admindashboard/staff/form.html'
    success_url = reverse_lazy('admindashboard:staff_list')
    activity_log_action = "Updated staff member"
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Edit Staff Member'
        return context
    
    def get_form(self, form_class=None):
        form = super().get_form(form_class)
        # Don't require password in update form
        form.fields['password'].required = False
        form.fields['confirm_password'].required = False
        return form
    
    def form_valid(self, form):
        staff = form.save(commit=False)
        # Only update password if provided
        if form.cleaned_data['password']:
            password = form.cleaned_data['password'].encode('utf-8')
            hashed_password = bcrypt.hashpw(password, bcrypt.gensalt())
            staff.password = hashed_password.decode('utf-8')
        staff.save()
        
        self.log_message = f"Updated staff member: {staff.username}"
        messages.success(self.request, 'Staff member updated successfully.')
        return super().form_valid(form)


class StaffDeleteView(LoginRequiredMixin, StaffRequiredMixin, ActivityLogMixin, DeleteView):
    model = Staff
    template_name = 'admindashboard/staff/delete.html'
    success_url = reverse_lazy('admindashboard:staff_list')
    context_object_name = 'staff_member'
    activity_log_action = "Deleted staff member"
    
    def delete(self, request, *args, **kwargs):
        staff = self.get_object()
        self.log_message = f"Deleted staff member: {staff.username}"
        messages.success(request, 'Staff member deleted successfully.')
        return super().delete(request, *args, **kwargs) 