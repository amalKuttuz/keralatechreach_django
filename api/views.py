from django.shortcuts import render, get_object_or_404
from rest_framework import viewsets, permissions, status, generics, filters
from rest_framework.response import Response
from rest_framework.decorators import action, api_view, permission_classes
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework_simplejwt.tokens import RefreshToken
from django.contrib.auth import authenticate, get_user_model
from django.contrib.auth.models import User
from keralatechreach.models import (
    University, Degree, District, EventCategory, Event, EventImpression, 
    Question, ApprovedQuestion, AppVersion, Category, BudgetSelection, 
    ContactMessage, Slider, EntranceNotification, 
    NotesUpload, EventInteraction, Product
)
from admindashboard.models import (
    QuestionPaper,
    Job,
    Initiative,
    News,
    Gallery,
    Exam,
    Note,
    UserProfile,
    AffiliateCategory,
    AffiliateBudgetSelection,
    AffiliateSliderItem,
    AffiliateProduct
)
from .serializers import (
    QuestionPaperSerializer, JobSerializer, EventSerializer,
    InitiativeSerializer, UserProfileSerializer, UserSerializer,
    UserRegistrationSerializer, NoteSerializer, ContactMessageSerializer, EntranceNotificationSerializer,
    AffiliateCategorySerializer, AffiliateBudgetSelectionSerializer, AffiliateSliderItemSerializer, AffiliateProductSerializer,
    AnalyticsSerializer,
    AppVersionSerializer,
    CategorySerializer,
    BudgetSelectionSerializer,
    UniversitySerializer,
    DegreeSerializer,
    ExamSerializer,
    DistrictSerializer,
    EventCategorySerializer,
    NewsSerializer,
    GallerySerializer,
    QuestionSerializer,
    ApprovedQuestionSerializer,
    SliderSerializer,
    NotesUploadSerializer,
    EventInteractionSerializer,
    EventImpressionSerializer,
    ProductSerializer
)
from rest_framework.views import APIView
from django.http import Http404, JsonResponse
import logging
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from keralatechreach.auth_utils import verify_php_password
from keralatechreach.models import User as LegacyUser
import time
from django.utils import timezone

logger = logging.getLogger(__name__)

# Create your views here.

class AuthViewSet(viewsets.ViewSet):
    permission_classes = [AllowAny]

    @action(detail=False, methods=['post'])
    def register(self, request):
        serializer = UserRegistrationSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            refresh = RefreshToken.for_user(user)
            return Response({
                'refresh': str(refresh),
                'access': str(refresh.access_token),
                'user': UserSerializer(user).data
            }, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @action(detail=False, methods=['post'])
    def login(self, request):
        username = request.data.get('username')
        password = request.data.get('password')
        user = authenticate(username=username, password=password)
        
        if user:
            refresh = RefreshToken.for_user(user)
            return Response({
                'refresh': str(refresh),
                'access': str(refresh.access_token),
                'user': UserSerializer(user).data
            })
        return Response({'error': 'Invalid credentials'}, 
                      status=status.HTTP_401_UNAUTHORIZED)

class QuestionPaperViewSet(viewsets.ModelViewSet):
    queryset = QuestionPaper.objects.filter(is_published=True)
    serializer_class = QuestionPaperSerializer
    permission_classes = [IsAuthenticated]

    @action(detail=False, methods=['post'])
    def upload(self, request):
        # This action is specifically for question paper upload.
        # The serializer handles validating the data and the file.
        # We need to get the actual University and Degree instances from the IDs/names.
        university_id = request.data.get('university_id')
        degree_name = request.data.get('degree')

        try:
            university = University.objects.get(id=university_id)
            degree = Degree.objects.get(name=degree_name, university=university)
        except (University.DoesNotExist, Degree.DoesNotExist):
            return Response({'error': 'Invalid university or degree provided.'}, status=status.HTTP_400_BAD_REQUEST)

        # Create a mutable copy of the request data to set the foreign key objects
        mutable_data = request.data.copy()
        mutable_data['university_id'] = university.id # Pass ID to serializer
        # Assuming serializer can handle degree name and resolve it, or you might need to pass degree ID
        # For now, assuming serializer takes degree name and year as in original Android request
        # If serializer expects degree ID, you'd set mutable_data['degree'] = degree.id

        serializer = self.get_serializer(data=mutable_data)

        if serializer.is_valid():
            # Save with the current user's profile
            serializer.save(created_by=request.user.userprofile)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class JobViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Job.objects.filter(is_published=True)
    serializer_class = JobSerializer
    permission_classes = [IsAuthenticated]

class EventViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Event.objects.filter(is_published=True)
    serializer_class = EventSerializer
    permission_classes = [IsAuthenticated]

class InitiativeViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Initiative.objects.filter(is_published=True)
    serializer_class = InitiativeSerializer
    permission_classes = [IsAuthenticated]

class UserProfileViewSet(viewsets.ModelViewSet):
    serializer_class = UserProfileSerializer
    permission_classes = [IsAuthenticated]
    # Allow PUT requests to update the profile
    http_method_names = ['get', 'put', 'head', 'options'] # Limit methods if needed

    def get_queryset(self):
        # Ensure users can only see/edit their own profile
        return UserProfile.objects.filter(user=self.request.user)

    def get_object(self):
        # Retrieve the profile for the currently authenticated user
        return self.request.user.userprofile

# ViewSet for Notes
class NoteViewSet(viewsets.ModelViewSet):
    queryset = Note.objects.all()
    serializer_class = NoteSerializer
    permission_classes = [IsAuthenticated]

    # Allow POST for uploads and GET for listing (if desired)
    http_method_names = ['get', 'post', 'head', 'options'] # Allow GET and POST

    def perform_create(self, serializer):
        # Associate the uploaded note with the current user's profile
        # Also, resolve Degree and University from the provided data (names/IDs)
        # The Android app sends university ID, degree name, semester, year, module, title, file.

        university_id = self.request.data.get('university') # Android sends as 'university'
        degree_name = self.request.data.get('degree')     # Android sends as 'degree'

        try:
            university = University.objects.get(id=university_id)
            degree = Degree.objects.get(name=degree_name, university=university)
        except (University.DoesNotExist, Degree.DoesNotExist):
            # Handle case where university or degree is not found
            # Returning a Response directly from perform_create is not standard, raise an exception
            # or handle validation in the serializer.
            # For simplicity here, we'll assume valid university/degree are provided based on Android UI.
            # A better approach would be to use SlugRelatedField or similar in serializer or explicit validation.
            logger.error(f"Invalid university ID {university_id} or degree name {degree_name} for note upload.")
            raise serializers.ValidationError({'university': 'Invalid university ID', 'degree': 'Invalid degree name'})

        # The serializer will handle saving the file and other fields.
        # We need to pass the resolved university and degree objects to the serializer.
        # Since the serializer is a ModelSerializer, it expects model instances for FKs.
        # The request.data contains primitive types (ID, names). We need to override create/update
        # in the serializer or handle this mapping here.

        # Let's override the create method in the serializer or handle it here.
        # A simple approach is to get the validated data and then explicitly set FKs before saving.
        # However, perform_create is called after is_valid(), so the data is already validated.
        # The serializer's create method is responsible for object creation.
        # We can pass extra arguments to the serializer's save method.

        # The serializer expects 'university' and 'degree' fields.
        # If the serializer expects the object instances, we need to retrieve them.
        # If the serializer expects IDs/names, our current serializer is fine.
        # Based on NoteSerializer fields=('id', 'title', 'module', 'degree', 'semester', 'year', 'university', 'file', 'uploaded_by', 'uploaded_at', 'is_published')
        # The serializer needs the actual Degree and University instances to save the FKs.

        # Let's modify the serializer to handle incoming degree name and university ID.
        # Or, we can retrieve the objects here and pass them.

        # Option 1: Retrieve objects here and pass to serializer save (simpler for now)
        try:
            university_obj = University.objects.get(id=university_id)
            degree_obj = Degree.objects.get(name=degree_name, university=university_obj)
        except (University.DoesNotExist, Degree.DoesNotExist):
             # This should ideally be handled by serializer validation, but as a fallback:
             # This won't work directly in perform_create as it doesn't return responses.
             # Returning a validation error from serializer is the correct DRF way.
             logger.error(f"Invalid university ID {university_id} or degree name {degree_name} for note upload (fallback).")
             raise serializers.ValidationError({'university': 'Invalid university ID', 'degree': 'Invalid degree name'})

        serializer.save(
            uploaded_by=self.request.user.userprofile,
            university=university_obj,
            degree=degree_obj
        )

# API view for version checking
class VersionCheckAPIView(APIView):
    permission_classes = [AllowAny]

    def get(self, request, *args, **kwargs):
        try:
            version_code_setting = SiteSetting.objects.get(key='app_version_code')
            version_name_setting = SiteSetting.objects.get(key='app_version_name')
            update_url_setting = SiteSetting.objects.get(key='app_update_url')
            update_message_setting = SiteSetting.objects.get(key='app_update_message')

            response_data = {
                'version_code': int(version_code_setting.value) if version_code_setting.value.isdigit() else 0,
                'version_name': version_name_setting.value,
                'update_url': update_url_setting.value,
                'update_message': update_message_setting.value,
            }
            return Response(response_data, status=status.HTTP_200_OK)

        except SiteSetting.DoesNotExist:
            # Handle cases where one or more settings are missing
            logger.error("Version settings not found in SiteSetting.")
            return Response({'error': 'Version settings not found'}, status=status.HTTP_404_NOT_FOUND)
        except Exception as e:
            # Handle other potential errors
            logger.exception("Error fetching version settings")
            return Response({'error': 'An error occurred while fetching version information'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

# API view for contact message submission
class ContactMessageAPIView(APIView):
    permission_classes = [IsAuthenticated] # Only authenticated users can send messages

    def post(self, request, *args, **kwargs):
        serializer = ContactMessageSerializer(data=request.data)
        if serializer.is_valid():
            # Associate the message with the current user's profile
            serializer.save(created_by=request.user.userprofile)

            # The Android app expects a success message and potentially a message ID
            # The ContactMessage model has an auto-generated ID.
            # We can return the ID and a success message.
            return Response({
                'success': True, # Assuming success on valid submission
                'message': 'Message sent successfully!',
                'messageId': serializer.instance.id # Return the ID of the created message
            }, status=status.HTTP_201_CREATED)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# API view for contact message status checking
class ContactMessageStatusAPIView(APIView):
    permission_classes = [IsAuthenticated] # Only authenticated users can check status

    def get(self, request, message_id, *args, **kwargs):
        try:
            # Fetch the message, ensuring it belongs to the authenticated user
            message = get_object_or_404(ContactMessage, id=message_id, created_by=request.user.userprofile)

            # Determine the status string based on is_read field
            status_string = "Read" if message.is_read else "Pending"

            response_data = {
                'success': True, # Assuming the request itself is successful
                'status': status_string,
                'message': f'Message status for ID {message_id}: {status_string}'
            }
            return Response(response_data, status=status.HTTP_200_OK)

        except Http404:
             logger.warning(f"Contact message with ID {message_id} not found for user {request.user.username}")
             return Response({'success': False, 'message': 'Message not found or does not belong to this user'}, status=status.HTTP_404_NOT_FOUND)
        except Exception as e:
            # Handle other potential errors
            logger.exception(f"Error fetching message status for ID {message_id}")
            return Response({'success': False, 'message': 'An error occurred while fetching message status'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

# ViewSet for Entrance Notifications
class EntranceNotificationViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = EntranceNotification.objects.filter(category='published').order_by('-deadline_date')
    serializer_class = EntranceNotificationSerializer
    permission_classes = [IsAuthenticated]

# Affiliate Marketing ViewSets

class AffiliateCategoryViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = AffiliateCategory.objects.all() # Adjust filtering as needed
    serializer_class = AffiliateCategorySerializer
    permission_classes = [AllowAny] # Assuming categories are public

class AffiliateBudgetSelectionViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = AffiliateBudgetSelection.objects.all().order_by('display_order') # Order by display order
    serializer_class = AffiliateBudgetSelectionSerializer
    permission_classes = [AllowAny] # Assuming budget selections are public

class AffiliateSliderItemViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = AffiliateSliderItem.objects.all().order_by('display_order') # Order by display order
    serializer_class = AffiliateSliderItemSerializer
    permission_classes = [AllowAny] # Assuming slider items are public

class AffiliateProductViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = AffiliateProduct.objects.all() # Base queryset
    serializer_class = AffiliateProductSerializer
    permission_classes = [AllowAny] # Assuming products are public

    @action(detail=False, methods=['get'])
    def category_products(self, request):
        category_id = request.query_params.get('category_id')
        if not category_id:
            return Response({'error': 'category_id query parameter is required.'}, status=status.HTTP_400_BAD_REQUEST)
        
        try:
            category_id = int(category_id)
        except ValueError:
            return Response({'error': 'category_id must be an integer.'}, status=status.HTTP_400_BAD_REQUEST)

        products = self.queryset.filter(category_id=category_id)
        serializer = self.get_serializer(products, many=True)
        return Response(serializer.data)

    @action(detail=False, methods=['get'])
    def budget_products(self, request):
        category_id = request.query_params.get('category_id')
        budget_limit = request.query_params.get('budget_limit')

        if not category_id or not budget_limit:
            return Response({'error': 'category_id and budget_limit query parameters are required.'}, status=status.HTTP_400_BAD_REQUEST)

        try:
            category_id = int(category_id)
            budget_limit = float(budget_limit) # Use float for DecimalField comparison
        except ValueError:
            return Response({'error': 'category_id must be an integer and budget_limit must be a number.'}, status=status.HTTP_400_BAD_REQUEST)

        products = self.queryset.filter(category_id=category_id, price__lte=budget_limit)
        serializer = self.get_serializer(products, many=True)
        return Response(serializer.data)

    @action(detail=False, methods=['get'])
    def category_by_id(self, request):
        category_id = request.query_params.get('category_id')
        if not category_id:
            return Response({'error': 'category_id query parameter is required.'}, status=status.HTTP_400_BAD_REQUEST)
        
        try:
            category_id = int(category_id)
            category = get_object_or_404(AffiliateCategory, id=category_id)
            serializer = AffiliateCategorySerializer(category)
            return Response(serializer.data)
        except ValueError:
             return Response({'error': 'category_id must be an integer.'}, status=status.HTTP_400_BAD_REQUEST)

User = get_user_model()

class AnalyticsAPIView(APIView):
    def get(self, request, *args, **kwargs):
        total_users = User.objects.count()
        total_notes = Note.objects.count()
        total_question_papers = QuestionPaper.objects.count()
        total_jobs = Job.objects.count()
        total_events = Event.objects.count()
        total_initiatives = Initiative.objects.count()

        data = {
            'total_users': total_users,
            'total_notes': total_notes,
            'total_question_papers': total_question_papers,
            'total_jobs': total_jobs,
            'total_events': total_events,
            'total_initiatives': total_initiatives,
        }
        serializer = AnalyticsSerializer(data=data)
        serializer.is_valid(raise_exception=True)
        return Response(serializer.validated_data)

# Version Check API
class CheckAppVersion(APIView):
    def get(self, request):
        latest_version = AppVersion.objects.order_by('-version_code').first()
        if not latest_version:
            return Response({"error": "No app version found"}, status=status.HTTP_404_NOT_FOUND)
        
        serializer = AppVersionSerializer(latest_version)
        return Response(serializer.data)

# Question Papers
class QuestionPaperList(generics.ListAPIView):
    queryset = QuestionPaper.objects.filter(is_published=True).order_by('-year')
    serializer_class = QuestionPaperSerializer

class QuestionPapersByDegree(generics.ListAPIView):
    serializer_class = QuestionPaperSerializer
    
    def get_queryset(self):
        degree_id = self.kwargs['degree_id']
        return QuestionPaper.objects.filter(
            degree_id=degree_id,
            is_published=True
        ).order_by('-year')

class QuestionPapersBySemester(generics.ListAPIView):
    serializer_class = QuestionPaperSerializer
    
    def get_queryset(self):
        degree_id = self.kwargs['degree_id']
        semester = self.kwargs['semester']
        return QuestionPaper.objects.filter(
            degree_id=degree_id,
            semester=semester,
            is_published=True
        ).order_by('-year')

# Universities
class UniversityList(generics.ListAPIView):
    queryset = University.objects.all()
    serializer_class = UniversitySerializer

# Degrees
class DegreeList(generics.ListAPIView):
    queryset = Degree.objects.all()
    serializer_class = DegreeSerializer

class DegreesByUniversity(generics.ListAPIView):
    serializer_class = DegreeSerializer
    
    def get_queryset(self):
        university_id = self.kwargs['university_id']
        return Degree.objects.filter(university_id=university_id)

# Exams
class ExamList(generics.ListAPIView):
    queryset = Exam.objects.filter(is_published=True).order_by('-exam_date')
    serializer_class = ExamSerializer

class ExamsByDegree(generics.ListAPIView):
    serializer_class = ExamSerializer
    
    def get_queryset(self):
        degree_id = self.kwargs['degree_id']
        return Exam.objects.filter(
            degree_name_id=degree_id,
            is_published=True
        ).order_by('-exam_date')

# Jobs
class JobList(generics.ListAPIView):
    queryset = Job.objects.filter(is_published=True).order_by('-last_date')
    serializer_class = JobSerializer

# Events
class EventList(generics.ListAPIView):
    queryset = Event.objects.filter(is_published=True).order_by('-event_start')
    serializer_class = EventSerializer

class EventCategoryList(generics.ListAPIView):
    queryset = EventCategory.objects.all()
    serializer_class = EventCategorySerializer

class EventsByDistrict(generics.ListAPIView):
    serializer_class = EventSerializer
    
    def get_queryset(self):
        district_id = self.kwargs['district_id']
        return Event.objects.filter(
            district_id=district_id,
            is_published=True
        ).order_by('-event_start')

# Districts
class DistrictList(generics.ListAPIView):
    queryset = District.objects.all()
    serializer_class = DistrictSerializer

# Initiatives
class InitiativeList(generics.ListAPIView):
    queryset = Initiative.objects.filter(is_published=True)
    serializer_class = InitiativeSerializer

# News
class NewsList(generics.ListAPIView):
    queryset = News.objects.filter(is_published=True).order_by('-created_at')
    serializer_class = NewsSerializer

class NewsDetail(generics.RetrieveAPIView):
    queryset = News.objects.filter(is_published=True)
    serializer_class = NewsSerializer
    lookup_field = 'slug'

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.views_count += 1
        instance.save()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)

# Gallery
class GalleryList(generics.ListAPIView):
    queryset = Gallery.objects.filter(is_visible=True).order_by('-created_at')
    serializer_class = GallerySerializer

# Contact
class ContactMessageCreate(generics.CreateAPIView):
    queryset = ContactMessage.objects.all()
    serializer_class = ContactMessageSerializer

# Entrance Notifications
class EntranceNotificationList(generics.ListAPIView):
    queryset = EntranceNotification.objects.filter(is_published=True).order_by('-deadline_date')
    serializer_class = EntranceNotificationSerializer
    permission_classes = [permissions.AllowAny]

# Affiliate Products
class ProductList(generics.ListAPIView):
    queryset = Product.objects.filter(status=1)
    serializer_class = ProductSerializer
    permission_classes = [permissions.AllowAny]

class CategoryList(generics.ListAPIView):
    queryset = Category.objects.filter(status=1).order_by('display_order')
    serializer_class = CategorySerializer
    permission_classes = [permissions.AllowAny]

class ProductsByCategory(generics.ListAPIView):
    serializer_class = ProductSerializer
    
    def get_queryset(self):
        category_id = self.kwargs['category_id']
        return Product.objects.filter(
            category_id=category_id,
            status=1
        )

# Budget Selections
class BudgetSelectionList(generics.ListAPIView):
    queryset = BudgetSelection.objects.filter(status=1).order_by('display_order')
    serializer_class = BudgetSelectionSerializer

class BudgetSelectionsByCategory(generics.ListAPIView):
    serializer_class = BudgetSelectionSerializer
    
    def get_queryset(self):
        category_id = self.kwargs['category_id']
        return BudgetSelection.objects.filter(
            category_id=category_id,
            status=1
        ).order_by('display_order')

# Sliders
class SliderViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Slider.objects.filter(status=1).order_by('display_order')
    serializer_class = SliderSerializer
    permission_classes = [permissions.AllowAny]

# Add the new QuestionViewSet after existing viewsets

class QuestionViewSet(viewsets.ModelViewSet):
    """
    API endpoint for Question papers
    """
    queryset = Question.objects.all()
    serializer_class = QuestionSerializer
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['degree', 'semester', 'university', 'year']
    search_fields = ['subject']
    
    def get_queryset(self):
        """Return only approved questions"""
        queryset = Question.objects.filter(status=True)
        return queryset

class QuestionsByDegreeView(generics.ListAPIView):
    """
    API endpoint for retrieving questions by degree and semester
    """
    serializer_class = QuestionSerializer
    
    def get_queryset(self):
        degree_id = self.kwargs.get('degree_id')
        semester = self.kwargs.get('semester')
        
        queryset = Question.objects.filter(
            degree_id=degree_id,
            semester=semester,
            status=True
        ).order_by('-year')
        
        return queryset

class UniversityViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = University.objects.all()
    serializer_class = UniversitySerializer
    permission_classes = [permissions.AllowAny]

class DegreeViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Degree.objects.all()
    serializer_class = DegreeSerializer
    permission_classes = [permissions.AllowAny]
    
    def get_queryset(self):
        queryset = Degree.objects.all()
        university_id = self.request.query_params.get('university_id', None)
        if university_id is not None:
            queryset = queryset.filter(university_id=university_id)
        return queryset

class DistrictViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = District.objects.all()
    serializer_class = DistrictSerializer
    permission_classes = [permissions.AllowAny]

class EventCategoryViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = EventCategory.objects.all()
    serializer_class = EventCategorySerializer
    permission_classes = [permissions.AllowAny]

class EventViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Event.objects.filter(is_published=True)
    serializer_class = EventSerializer
    permission_classes = [permissions.AllowAny]
    
    def get_queryset(self):
        queryset = Event.objects.all().order_by('-event_start')
        category_id = self.request.query_params.get('category_id', None)
        district_id = self.request.query_params.get('district_id', None)
        
        if category_id is not None:
            queryset = queryset.filter(category_id=category_id)
        if district_id is not None:
            queryset = queryset.filter(district_id=district_id)
        
        return queryset

class EventImpressionViewSet(viewsets.ModelViewSet):
    queryset = EventImpression.objects.all()
    serializer_class = EventImpressionSerializer
    permission_classes = [permissions.AllowAny]

class RecordEventImpression(APIView):
    permission_classes = [permissions.AllowAny]
    
    def post(self, request, format=None):
        event_id = request.data.get('event_id')
        user_id = request.data.get('user_id')
        source = request.data.get('source', 'unspecified')
        
        if not event_id:
            return Response({'error': 'event_id is required'}, status=status.HTTP_400_BAD_REQUEST)
        
        # Create the impression
        impression = EventImpression.objects.create(
            event_id=event_id,
            user_id=user_id,
            source=source,
            timestamp=timezone.now()
        )
        
        return Response({'status': 'impression recorded'}, status=status.HTTP_201_CREATED)

class EventInteractionViewSet(viewsets.ModelViewSet):
    queryset = EventInteraction.objects.all()
    serializer_class = EventInteractionSerializer
    permission_classes = [permissions.AllowAny]

class RecordEventInteraction(APIView):
    permission_classes = [permissions.AllowAny]
    
    def post(self, request, format=None):
        event_id = request.data.get('event_id')
        user_id = request.data.get('user_id')
        interaction_type = request.data.get('interaction_type')
        ip_address = request.data.get('ip_address')
        
        if not event_id or not interaction_type:
            return Response({'error': 'event_id and interaction_type are required'}, 
                            status=status.HTTP_400_BAD_REQUEST)
        
        # Create the interaction
        interaction = EventInteraction.objects.create(
            event_id=event_id,
            user_id=user_id,
            interaction_type=interaction_type,
            ip_address=ip_address
        )
        
        return Response({'status': 'interaction recorded'}, status=status.HTTP_201_CREATED)

class QuestionViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = QuestionSerializer
    permission_classes = [permissions.AllowAny]
    
    def get_queryset(self):
        queryset = Question.objects.filter(status=True)
        deg = self.request.query_params.get('deg', None)
        sem = self.request.query_params.get('sem', None)
        subj = self.request.query_params.get('subj', None)
        university = self.request.query_params.get('university', None)
        
        if deg is not None:
            queryset = queryset.filter(deg=deg)
        if sem is not None:
            queryset = queryset.filter(sem=sem)
        if subj is not None:
            queryset = queryset.filter(subj=subj)
        if university is not None:
            queryset = queryset.filter(university=university)
        
        return queryset

class ApprovedQuestionViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = ApprovedQuestionSerializer
    permission_classes = [permissions.AllowAny]
    
    def get_queryset(self):
        queryset = ApprovedQuestion.objects.all()
        deg = self.request.query_params.get('deg', None)
        sem = self.request.query_params.get('sem', None)
        subj = self.request.query_params.get('subj', None)
        university = self.request.query_params.get('university', None)
        
        if deg is not None:
            queryset = queryset.filter(deg=deg)
        if sem is not None:
            queryset = queryset.filter(sem=sem)
        if subj is not None:
            queryset = queryset.filter(subj=subj)
        if university is not None:
            queryset = queryset.filter(university=university)
        
        return queryset

class AppVersionView(APIView):
    permission_classes = [permissions.AllowAny]
    
    def get(self, request, format=None):
        app_version = AppVersion.objects.first()  # Get the latest version
        if app_version:
            serializer = AppVersionSerializer(app_version)
            return Response(serializer.data)
        return Response({'error': 'No app version found'}, status=status.HTTP_404_NOT_FOUND)

class CategoryViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Category.objects.filter(status=1).order_by('display_order')
    serializer_class = CategorySerializer
    permission_classes = [permissions.AllowAny]

class BudgetSelectionViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = BudgetSelectionSerializer
    permission_classes = [permissions.AllowAny]
    
    def get_queryset(self):
        queryset = BudgetSelection.objects.filter(status=1).order_by('display_order')
        category_id = self.request.query_params.get('category_id', None)
        if category_id is not None:
            queryset = queryset.filter(category_id=category_id)
        return queryset

class ContactMessageCreateView(generics.CreateAPIView):
    queryset = ContactMessage.objects.all()
    serializer_class = ContactMessageSerializer
    permission_classes = [permissions.AllowAny]

class SliderViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Slider.objects.filter(status=1).order_by('display_order')
    serializer_class = SliderSerializer
    permission_classes = [permissions.AllowAny]

class EntranceNotificationViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = EntranceNotification.objects.all().order_by('deadline_date')
    serializer_class = EntranceNotificationSerializer
    permission_classes = [permissions.AllowAny]
    
    def get_queryset(self):
        queryset = EntranceNotification.objects.all().order_by('deadline_date')
        category = self.request.query_params.get('category', None)
        if category is not None:
            queryset = queryset.filter(category=category)
        return queryset

class NotesUploadViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = NotesUpload.objects.filter(status=True)
    serializer_class = NotesUploadSerializer
    permission_classes = [permissions.AllowAny]

class ProductViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Product.objects.filter(status=1)
    serializer_class = ProductSerializer
    permission_classes = [permissions.AllowAny]

class CustomTokenObtainPairSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)

        # Add custom claims
        token['username'] = user.username
        token['email'] = user.email
        token['is_staff'] = user.is_staff
        
        # Add profile information if available
        if hasattr(user, 'userprofile'):
            profile = user.userprofile
            token['phone'] = profile.phone
            token['user_type'] = profile.user_type
            if profile.district:
                token['district'] = profile.district.name
        
        return token

class CustomTokenObtainPairView(TokenObtainPairView):
    serializer_class = CustomTokenObtainPairSerializer

class TokenVerifyWithLegacyView(APIView):
    permission_classes = [AllowAny]
    
    def post(self, request, *args, **kwargs):
        username = request.data.get('username')
        password = request.data.get('password')
        
        if not username or not password:
            return Response(
                {'error': 'Please provide both username and password'},
                status=status.HTTP_400_BAD_REQUEST
            )
        
        start_time = time.time()
        
        # First try normal Django authentication
        user = authenticate(request=request, username=username, password=password)
        
        if not user:
            # If Django authentication fails, try legacy authentication
            try:
                legacy_user = LegacyUser.objects.get(userid=username)
                if verify_php_password(password, legacy_user.password):
                    # If legacy auth succeeds, migrate on-the-fly
                    from keralatechreach.auth_utils import migrate_legacy_user
                    user = migrate_legacy_user(legacy_user.id, password)
                    logger.info(f"Migrated legacy user {username} during login")
            except LegacyUser.DoesNotExist:
                pass
        
        auth_time = time.time() - start_time
        logger.debug(f"Authentication for {username} took {auth_time:.2f} seconds")
        
        if user:
            # Update last login IP
            if hasattr(user, 'userprofile'):
                user.userprofile.last_login_ip = request.META.get('REMOTE_ADDR')
                user.userprofile.failed_login_attempts = 0
                user.userprofile.save()
                
            # Generate token
            serializer = CustomTokenObtainPairSerializer()
            token = serializer.get_token(user)
            
            return Response({
                'access': str(token.access_token),
                'refresh': str(token),
                'user': {
                    'id': user.id,
                    'username': user.username,
                    'email': user.email,
                    'is_staff': user.is_staff,
                    'is_superuser': user.is_superuser,
                }
            })
        else:
            # Increment failed login attempts if user exists
            try:
                django_user = User.objects.get(username=username)
                if hasattr(django_user, 'userprofile'):
                    django_user.userprofile.failed_login_attempts += 1
                    django_user.userprofile.save()
                    
                    # Auto-block after too many attempts
                    if django_user.userprofile.failed_login_attempts >= 5:
                        django_user.userprofile.is_blocked = True
                        django_user.userprofile.save()
                        logger.warning(f"User {username} blocked after too many failed login attempts")
                        return Response(
                            {'error': 'Account blocked due to too many failed login attempts. Please contact support.'},
                            status=status.HTTP_403_FORBIDDEN
                        )
            except User.DoesNotExist:
                pass
                
            return Response(
                {'error': 'Invalid credentials'}, 
                status=status.HTTP_401_UNAUTHORIZED
            )

class UniversityListView(generics.ListAPIView):
    queryset = University.objects.all()
    serializer_class = UniversitySerializer
    permission_classes = [permissions.AllowAny]

class UniversityDetailView(generics.RetrieveAPIView):
    queryset = University.objects.all()
    serializer_class = UniversitySerializer
    permission_classes = [permissions.AllowAny]

class DegreeListView(generics.ListAPIView):
    queryset = Degree.objects.all()
    serializer_class = DegreeSerializer
    permission_classes = [permissions.AllowAny]

class DegreeDetailView(generics.RetrieveAPIView):
    queryset = Degree.objects.all()
    serializer_class = DegreeSerializer
    permission_classes = [permissions.AllowAny]

class UniversityDegreesView(generics.ListAPIView):
    serializer_class = DegreeSerializer
    permission_classes = [permissions.AllowAny]

    def get_queryset(self):
        university_id = self.kwargs['university_id']
        return Degree.objects.filter(university_id=university_id)

class EventListView(generics.ListAPIView):
    queryset = Event.objects.filter(is_published=True)
    serializer_class = EventSerializer
    permission_classes = [permissions.AllowAny]

class EventDetailView(generics.RetrieveAPIView):
    queryset = Event.objects.filter(is_published=True)
    serializer_class = EventSerializer
    permission_classes = [permissions.AllowAny]

class EventCategoryListView(generics.ListAPIView):
    queryset = EventCategory.objects.all()
    serializer_class = EventCategorySerializer
    permission_classes = [permissions.AllowAny]

class DistrictListView(generics.ListAPIView):
    queryset = District.objects.all()
    serializer_class = DistrictSerializer
    permission_classes = [permissions.AllowAny]

class NewsListView(generics.ListAPIView):
    queryset = News.objects.filter(is_published=True)
    serializer_class = NewsSerializer
    permission_classes = [permissions.AllowAny]

class NewsDetailView(generics.RetrieveAPIView):
    queryset = News.objects.filter(is_published=True)
    serializer_class = NewsSerializer
    permission_classes = [permissions.AllowAny]

class NewsBySlugView(generics.RetrieveAPIView):
    queryset = News.objects.filter(is_published=True)
    serializer_class = NewsSerializer
    permission_classes = [permissions.AllowAny]
    lookup_field = 'slug'

class GalleryListView(generics.ListAPIView):
    queryset = Gallery.objects.filter(is_visible=True)
    serializer_class = GallerySerializer
    permission_classes = [permissions.AllowAny]

class ExamListView(generics.ListAPIView):
    queryset = Exam.objects.filter(is_published=True)
    serializer_class = ExamSerializer
    permission_classes = [permissions.AllowAny]

class ExamDetailView(generics.RetrieveAPIView):
    queryset = Exam.objects.filter(is_published=True)
    serializer_class = ExamSerializer
    permission_classes = [permissions.AllowAny]

class JobListView(generics.ListAPIView):
    queryset = Job.objects.filter(is_published=True)
    serializer_class = JobSerializer
    permission_classes = [permissions.AllowAny]

class JobDetailView(generics.RetrieveAPIView):
    queryset = Job.objects.filter(is_published=True)
    serializer_class = JobSerializer
    permission_classes = [permissions.AllowAny]

class InitiativeListView(generics.ListAPIView):
    queryset = Initiative.objects.filter(is_published=True)
    serializer_class = InitiativeSerializer
    permission_classes = [permissions.AllowAny]

class EntranceNotificationListView(generics.ListAPIView):
    queryset = EntranceNotification.objects.filter(is_published=True).order_by('-deadline_date')
    serializer_class = EntranceNotificationSerializer
    permission_classes = [permissions.AllowAny]

class QuestionsByDegreeView(generics.ListAPIView):
    serializer_class = QuestionSerializer
    permission_classes = [permissions.AllowAny]

    def get_queryset(self):
        degree_id = self.kwargs['degree_id']
        semester = self.kwargs['semester']
        return Question.objects.filter(degree_id=degree_id, semester=semester)

class QuestionPaperListView(generics.ListAPIView):
    queryset = QuestionPaper.objects.filter(is_published=True)
    serializer_class = QuestionPaperSerializer
    permission_classes = [permissions.AllowAny]

class QuestionPaperDetailView(generics.RetrieveAPIView):
    queryset = QuestionPaper.objects.filter(is_published=True)
    serializer_class = QuestionPaperSerializer
    permission_classes = [permissions.AllowAny]
