from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.contrib.auth import get_user_model
from ..models import UserProfile
from ..forms import UserRegistrationForm, UserProfileForm

def register(request):
    if request.method == 'POST':
        form = UserRegistrationForm(request.POST)
        if form.is_valid():
            user = form.save()
            # Create associated profile
            UserProfile.objects.create(user=user)
            messages.success(request, 'Registration successful. You can now login.')
            return redirect('admindashboard:login')
    else:
        form = UserRegistrationForm()
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