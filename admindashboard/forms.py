from django import forms
from api.models import Question, Event, Contact, Job # or just one for now

class QuestionForm(forms.ModelForm):
    class Meta:
        model = Question
        fields = ['question_text'] # adjust based on your model fields

class EventForm(forms.ModelForm):
    class Meta:
        model = Event
        fields = ['title', 'description', 'date']  # adjust as needed

class ContactForm(forms.ModelForm):
    class Meta:
        model = Contact
        fields = ['name', 'email', 'message'] # adjust

class JobForm(forms.ModelForm):
    class Meta:
        model = Job
        fields = ['title', 'description', 'company'] # adjust