# api/views.py

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import ApprovedQuestionPaper,University, Degree,Exam,Job,District,Event,District,EventCategory,Initiative
from .serializers import ApprovedQuestionPaperSerializer,UniversitySerializer, DegreeSerializer,ExamSerializer,InitiativeSerializer,JobSerializer, EventSerializer, DistrictSerializer, EventCategorySerializer
from django.conf import settings
from datetime import date
from rest_framework.permissions import AllowAny
from django.db import connection
import logging
from .permissions import HasValidAPIKey
from django.db.models import Q
from .auth import validate_api_key
from datetime import datetime
from rest_framework.decorators import api_view



class GetPDFAPIView(APIView):
    def get(self, request):
        api_key = request.GET.get('api_key')
        if api_key != settings.API_SECRET_KEY:
            return Response({'error': 'Unauthorized access'}, status=status.HTTP_401_UNAUTHORIZED)
            
        degree = request.GET.get('degree')
        semester = request.GET.get('semester')

        if not degree or not semester:
            return Response({'error': 'Missing degree or semester'}, status=status.HTTP_400_BAD_REQUEST)

        papers = ApprovedQuestionPaper.objects.filter(degree=degree, semester=semester).order_by('year')
        serializer = ApprovedQuestionPaperSerializer(papers, many=True)
        return Response(serializer.data)



class MobileGetPDFAPIView(APIView):
    

    def get(self, request):
        api_key = request.GET.get('api_key')
        if api_key != settings.API_SECRET_KEY:
            return Response({'error': 'Unauthorized access'}, status=status.HTTP_401_UNAUTHORIZED)
        degree = request.GET.get('degree')
        semester = request.GET.get('semester')

        if not degree or not semester:
            return Response({'error': 'Missing parameters'}, status=status.HTTP_400_BAD_REQUEST)

        papers = ApprovedQuestionPaper.objects.filter(degree=degree, semester=semester).order_by('-year')
        data = [
            {
                'subject': paper.subject,
                'year': paper.year,
                'file_url': request.build_absolute_uri('/media/' + paper.file_path)
            }
            for paper in papers
        ]
        return Response(data)

# api/views.py


class DegreesAPIView(APIView):
    def get(self, request):
        
        api_key = request.GET.get('api_key')
        if api_key != settings.API_SECRET_KEY:
            return Response({'error': 'Unauthorized access'}, status=status.HTTP_401_UNAUTHORIZED)
        query_type = request.GET.get('type', 'all')

        if query_type == 'university':
            universities = University.objects.all().order_by('name')
            serializer = UniversitySerializer(universities, many=True)
            return Response(serializer.data)

        elif query_type == 'degree' and 'university_id' in request.GET:
            university_id = request.GET['university_id']
            degrees = Degree.objects.filter(university_id=university_id).order_by('name')
            serializer = DegreeSerializer(degrees, many=True)
            return Response([d['name'] for d in serializer.data])  # return just names

        else:
            degrees = Degree.objects.all().order_by('name')
            serializer = DegreeSerializer(degrees, many=True)
            return Response([d['name'] for d in serializer.data])

class ExamViewAPIView(APIView):
    def get(self, request):
       api_key = request.GET.get('api_key')
        if api_key != settings.API_SECRET_KEY:
            return Response({'error': 'Unauthorized access'}, status=status.HTTP_401_UNAUTHORIZED)

        required_fields = ['university', 'degree', 'semester', 'admission_year']
        if not all(param in request.GET for param in required_fields):
            return Response({'error': 'Missing required parameters'}, status=status.HTTP_400_BAD_REQUEST)

        university_name = request.GET['university']
        degree = request.GET['degree']
        semester = request.GET['semester']
        admission_year = request.GET['admission_year']

        try:
            university = University.objects.get(name=university_name)
        except University.DoesNotExist:
            return Response([], status=status.HTTP_200_OK)

        exams = Exam.objects.filter(
            university=university,
            degree_name=degree,
            semester=semester,
            admission_year=admission_year
        )

        serializer = ExamSerializer(exams, many=True)
        return Response(serializer.data)
    

class GetJobAPIView(APIView):
    def get(self, request):
       api_key = request.GET.get('api_key')
        if api_key != settings.API_SECRET_KEY:
            return Response({'error': 'Unauthorized access'}, status=status.HTTP_401_UNAUTHORIZED)

        jobs = Job.objects.filter(deadline__gte=date.today()).order_by('-created_at')
        serializer = JobSerializer(jobs, many=True)
        return Response({'success': True, 'jobs': serializer.data})


class GetJobDetailsAPIView(APIView):
    def get(self, request):
        api_key = request.GET.get('api_key')
        if api_key != settings.API_SECRET_KEY:
            return Response({'error': 'Unauthorized access'}, status=status.HTTP_401_UNAUTHORIZED)
        job_id = request.GET.get('id')
        if not job_id:
            return Response({'success': False, 'message': 'Job ID is required'}, status=status.HTTP_400_BAD_REQUEST)

        try:
            job = Job.objects.get(id=job_id)
            serializer = JobSerializer(job)
            return Response({'success': True, 'job': serializer.data})
        except Job.DoesNotExist:
            return Response({'success': False, 'message': 'Job not found'}, status=status.HTTP_404_NOT_FOUND)

# api/views/m_calender2.py

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.db import connection
from django.utils.dateparse import parse_date
from api.auth import validate_api_key

class EventCalendarAPIView(APIView):
    def get(self, request):
        api_key = request.GET.get('api_key')
        if api_key != settings.API_SECRET_KEY:
            return Response({'error': 'Unauthorized access'}, status=status.HTTP_401_UNAUTHORIZED)
        action = request.query_params.get("action", "getEventDates").lower()
        if action == "geteventdates":
            return self.get_event_dates()
        elif action == "geteventsbyid":
            return self.get_events_by_id(request)
        elif action == "getcategories":
            return self.get_categories()
        elif action == "getdistricts":
            return self.get_districts()
        elif action == "getfilteredevents":
            return self.get_filtered_events(request)
        else:
            return Response({
                'error': 'Invalid action',
                'received_action': request.query_params.get("action")
            }, status=status.HTTP_400_BAD_REQUEST)

    def get_event_dates(self):
        api_key = request.GET.get('api_key')
        if api_key != settings.API_SECRET_KEY:
            return Response({'error': 'Unauthorized access'}, status=status.HTTP_401_UNAUTHORIZED)
        query = """
            SELECT e.id, e.category_id, DATE(e.event_start), DATE(e.event_end), e.name, e.place,
                   d.district_id, d.district, c.category
            FROM events e
            LEFT JOIN districts d ON e.district_id = d.district_id
            LEFT JOIN event_category c ON e.category_id = c.category_id
            ORDER BY e.event_start
        """
        return self.fetch_and_respond(query)

    def get_events_by_id(self, request):
        api_key = request.GET.get('api_key')
        if api_key != settings.API_SECRET_KEY:
            return Response({'error': 'Unauthorized access'}, status=status.HTTP_401_UNAUTHORIZED)
        event_id = request.query_params.get("id")
        if not event_id:
            return Response({'error': 'Please provide an id'}, status=status.HTTP_400_BAD_REQUEST)

        query = f"""
            SELECT e.id, e.category_id, e.event_start, e.event_end, e.name, e.link,
                   e.place, e.description, e.map_link,
                   d.district_id, d.district,
                   c.category_id AS event_category_id, c.category
            FROM events e
            LEFT JOIN districts d ON e.district_id = d.district_id
            LEFT JOIN event_category c ON e.category_id = c.category_id
            WHERE e.id = %s
        """
        return self.fetch_and_respond(query, [event_id])

    def get_categories(self):
        api_key = request.GET.get('api_key')
        if api_key != settings.API_SECRET_KEY:
            return Response({'error': 'Unauthorized access'}, status=status.HTTP_401_UNAUTHORIZED)
        query = "SELECT category_id, category FROM event_category ORDER BY category"
        return self.fetch_and_respond(query)

    def get_districts(self):
        api_key = request.GET.get('api_key')
        if api_key != settings.API_SECRET_KEY:
            return Response({'error': 'Unauthorized access'}, status=status.HTTP_401_UNAUTHORIZED)
        query = "SELECT district_id, district FROM districts ORDER BY district"
        return self.fetch_and_respond(query)

    def get_filtered_events(self, request):
        api_key = request.GET.get('api_key')
        if api_key != settings.API_SECRET_KEY:
            return Response({'error': 'Unauthorized access'}, status=status.HTTP_401_UNAUTHORIZED)
        filters = []
        params = []

        if 'category_id' in request.query_params:
            filters.append("e.category_id = %s")
            params.append(request.query_params['category_id'])

        if 'district_id' in request.query_params:
            filters.append("e.district_id = %s")
            params.append(request.query_params['district_id'])

        if 'date' in request.query_params:
            filters.append("(%s BETWEEN DATE(e.event_start) AND DATE(e.event_end))")
            params.append(request.query_params['date'])

        where_clause = f"WHERE {' AND '.join(filters)}" if filters else ""
        query = f"""
            SELECT e.id, e.category_id, DATE(e.event_start), DATE(e.event_end), e.name, e.place,
                   d.district_id, d.district, c.category
            FROM events e
            LEFT JOIN districts d ON e.district_id = d.district_id
            LEFT JOIN event_category c ON e.category_id = c.category_id
            {where_clause}
            ORDER BY e.event_start
        """
        return self.fetch_and_respond(query, params)

    def fetch_and_respond(self, query, params=None):
        with connection.cursor() as cursor:
            cursor.execute(query, params or [])
            columns = [col[0] for col in cursor.description]
            results = [dict(zip(columns, row)) for row in cursor.fetchall()]
        return Response(results, status=status.HTTP_200_OK)


class ContactAPIView(APIView):
    def get(self, request):
        api_key = request.GET.get('api_key')
        if api_key != settings.API_SECRET_KEY:
            return Response({'error': 'Unauthorized access'}, status=status.HTTP_401_UNAUTHORIZED)

        action = request.query_params.get("action", "").lower()

        if action == "getcontact":
            return self.get_contact()
        elif action == "getdistricts":
            return self.get_districts()
        else:
            return Response({"error": "Invalid action"}, status=status.HTTP_400_BAD_REQUEST)

    def get_contact(self):
        
        query = """
            SELECT c.id, c.name, c.phone, c.email, c.office_name, d.district 
            FROM contacts c
            LEFT JOIN districts d ON c.district_id = d.district_id
            ORDER BY c.name
        """
        with connection.cursor() as cursor:
            cursor.execute(query)
            columns = [col[0] for col in cursor.description]
            contacts = [dict(zip(columns, row)) for row in cursor.fetchall()]

        return Response({"contacts": contacts})

    def get_districts(self):
        
        query = "SELECT district_id as id, district FROM districts ORDER BY district"
        with connection.cursor() as cursor:
            cursor.execute(query)
            columns = [col[0] for col in cursor.description]
            districts = [dict(zip(columns, row)) for row in cursor.fetchall()]

        return Response({"districts": districts})


class DistrictListView(APIView):

    def get(self, request):
        districts = District.objects.all().order_by('name')
        data = [{'id': d.id, 'name': d.name} for d in districts]
        return Response(data, status=status.HTTP_200_OK)




@api_view(['GET'])
def events_api(request):
    api_key = request.GET.get('api_key')
        if api_key != settings.API_SECRET_KEY:
            return Response({'error': 'Unauthorized access'}, status=status.HTTP_401_UNAUTHORIZED)
    action = request.query_params.get('action')
    last_update = request.query_params.get('lastUpdate', '2025-03-01 00:00:00')

    try:
        if action == 'getAllEvents':
            categories = EventCategory.objects.all()
            districts = District.objects.all()
            events = Event.objects.select_related('category', 'district').all()

        elif action == 'getUpdatedEvents':
            categories = EventCategory.objects.filter(created_at__gt=last_update)
            districts = District.objects.filter(created_at__gt=last_update)
            events = Event.objects.filter(created_at__gt=last_update).select_related('category', 'district')

        else:
            return Response({'error': 'Invalid action specified'}, status=status.HTTP_400_BAD_REQUEST)

        response_data = {
            'categories': EventCategorySerializer(categories, many=True).data,
            'districts': DistrictSerializer(districts, many=True).data,
            'events': EventSerializer(events, many=True).data,
        }

        return Response(response_data)

    except Exception as e:
        return Response({'error': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class InitiativeListView(APIView):
    def get(self, request):
        api_key = request.GET.get('api_key')
        if api_key != settings.API_SECRET_KEY:
            return Response({'error': 'Unauthorized access'}, status=status.HTTP_401_UNAUTHORIZED)
        initiatives = Initiative.objects.all().order_by('-id')
        serializer = InitiativeSerializer(initiatives, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
