from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from api.models import ApprovedQuestionPaper, Event, Job # adjust as needed
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect, get_object_or_404
from .forms import QuestionForm, EventForm, ContactForm, JobForm
from api.models import ApprovedQuestionPaper, Event, Contact, Job

@login_required
def dashboard(request):
    return render(request, 'admindashboard/dashboard.html')

@login_required
def question_list(request):
    questions = ApprovedQuestionPaper.objects.all()
    return render(request, 'admindashboard/questions/list.html', {'questions': questions})

@login_required
def question_create(request):
    form = QuestionForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('question_list')
    return render(request, 'admindashboard/questions/form.html', {'form': form})

@login_required
def question_edit(request, pk):
    question = get_object_or_404(ApprovedQuestionPaper, pk=pk)
    form = QuestionForm(request.POST or None, instance=question)
    if form.is_valid():
        form.save()
        return redirect('question_list')
    return render(request, 'admindashboard/questions/form.html', {'form': form})

@login_required
def question_delete(request, pk):
    question = get_object_or_404(ApprovedQuestionPaper, pk=pk)
    if request.method == 'POST':
        question.delete()
        return redirect('question_list')
    return render(request, 'admindashboard/questions/confirm_delete.html', {'object': question})

