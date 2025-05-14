from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.contrib.auth import get_user_model
from django.contrib.auth.models import User
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from django.db import transaction
from ..models import UserProfile
from ..forms import (
    CustomUserCreationForm, CustomUserChangeForm,
    UserProfileForm, UserProfileUpdateForm, UserManagementForm
)

def register(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            with transaction.atomic():
                user = form.save()
                # Create associated profile
                UserProfile.objects.create(
                    user=user,
                    email=form.cleaned_data['email']
                )
                messages.success(request, 'Registration successful. You can now login.')
                return redirect('admindashboard:login')
    else:
        form = CustomUserCreationForm()
    return render(request, 'admindashboard/register.html', {'form': form})

@login_required
def profile(request):
    if request.method == 'POST':
        form = UserProfileForm(request.POST, request.FILES, instance=request.user.userprofile)
        if form.is_valid():
            form.save()
            messages.success(request, 'Your profile has been updated.')
            return redirect('admindashboard:profile')
    else:
        form = UserProfileForm(instance=request.user.userprofile)
    return render(request, 'admindashboard/users/profile.html', {'form': form})

@login_required
def user_list(request):
    User = get_user_model()
    users = User.objects.select_related('userprofile').all()
    return render(request, 'admindashboard/users/list.html', {'users': users})

@login_required
def user_detail(request, pk):
    User = get_user_model()
    user = get_object_or_404(User.objects.select_related('userprofile'), pk=pk)
    return render(request, 'admindashboard/users/detail.html', {'user_detail': user})

@login_required
def user_delete(request, pk):
    User = get_user_model()
    user = get_object_or_404(User, pk=pk)
    if request.method == 'POST':
        user.delete()
        messages.success(request, 'User deleted successfully.')
        return redirect('admindashboard:user_list')
    return render(request, 'admindashboard/users/delete.html', {'user': user})

class UserListView(LoginRequiredMixin, ListView):
    model = User
    template_name = 'admindashboard/user/list.html'
    context_object_name = 'users'
    paginate_by = 10

    def get_queryset(self):
        return User.objects.all().order_by('-date_joined')

class UserCreateView(LoginRequiredMixin, CreateView):
    model = User
    template_name = 'admindashboard/user/form.html'
    form_class = CustomUserCreationForm
    success_url = reverse_lazy('admindashboard:user_list')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Add New User'
        context['button_text'] = 'Create User'
        return context

    def form_valid(self, form):
        messages.success(self.request, 'User created successfully.')
        return super().form_valid(form)

class UserUpdateView(LoginRequiredMixin, UpdateView):
    model = User
    template_name = 'admindashboard/user/form.html'
    form_class = CustomUserChangeForm
    success_url = reverse_lazy('admindashboard:user_list')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Edit User'
        context['button_text'] = 'Update User'
        return context

    def form_valid(self, form):
        messages.success(self.request, 'User updated successfully.')
        return super().form_valid(form)

class UserDeleteView(LoginRequiredMixin, DeleteView):
    model = User
    template_name = 'admindashboard/user/delete.html'
    success_url = reverse_lazy('admindashboard:user_list')

    def delete(self, request, *args, **kwargs):
        messages.success(self.request, 'User deleted successfully.')
        return super().delete(request, *args, **kwargs) 