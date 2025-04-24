# api/urls.py
from django.urls import path
from .views import *

urlpatterns = [
    path('get_pdf.php', GetPDFAPIView.as_view(), name='get_pdf'),
    path('m_getpdf.php', MobileGetPDFAPIView.as_view(), name='mobile_get_pdf'),
    path('Exam/degrees.php', DegreesAPIView.as_view(), name='degrees_api'),
    path('Exam/exam_view.php', ExamViewAPIView.as_view(), name='exam_view_api'),
    path('Exam/get_job.php', GetJobAPIView.as_view(), name='get_job_api'),
    path('Exam/get_job_details.php', GetJobDetailsAPIView.as_view(), name='get_job_details_api'),
    path("Exam/m_calender2.php", EventCalendarAPIView.as_view(), name="calendar-api"),
    path('Exam/m_contact.php', ContactAPIView.as_view(), name='contact_api'),
    path('Exam/m_districts.php', DistrictListView.as_view(), name='districts-list'),
    path('Exam/m_events.php', events_api),
    path('Exam/m_get_initiatives.php', InitiativeListView.as_view(), name='initiatives-list'),




]
