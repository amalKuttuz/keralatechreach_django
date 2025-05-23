import os
import mimetypes
from pathlib import Path
from django.conf import settings
from django.http import FileResponse, HttpResponse, HttpResponseForbidden, Http404
from django.views.decorators.http import require_GET
from django.utils.decorators import method_decorator
from django.views.decorators.cache import cache_control
from django.views import View
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth.decorators import login_required
from django.shortcuts import render


def bad_request(request, exception):
    return render(request, 'keralatechreach/400.html', status=400)


def permission_denied(request, exception):
    return render(request, 'keralatechreach/403.html', status=403)


def page_not_found(request, exception):
    return render(request, 'keralatechreach/404.html', status=404)


def server_error(request):
    return render(request, 'keralatechreach/500.html', status=500)


@require_GET
@cache_control(max_age=86400)  # Cache for 1 day
def serve_protected_file(request, file_path):
    """
    Securely serve a file from media directory by checking permissions.
    This view ensures that only authorized users can access protected files.
    """
    # Normalize path to prevent directory traversal attacks
    file_path = os.path.normpath(file_path).lstrip('/')
    
    # Full path to the file
    full_path = os.path.join(settings.MEDIA_ROOT, file_path)
    
    # Check if the file exists
    if not os.path.exists(full_path) or not os.path.isfile(full_path):
        raise Http404("File not found")
    
    # Check permissions based on file type/directory
    path_parts = Path(file_path).parts
    if len(path_parts) > 0:
        folder = path_parts[0]
        
        # Determine access restrictions based on folder
        if folder in ['questions', 'notes_upload']:
            # These require login to access
            if not request.user.is_authenticated:
                return HttpResponseForbidden("You must be logged in to access this file.")
        
        # Add more custom permissions as needed
        # For example, check if the user has purchased a premium course, etc.
    
    # Get the file's MIME type
    content_type, encoding = mimetypes.guess_type(full_path)
    if not content_type:
        content_type = 'application/octet-stream'
    
    # Return the file
    response = FileResponse(open(full_path, 'rb'), content_type=content_type)
    
    # Set appropriate filename for downloads
    filename = os.path.basename(file_path)
    response['Content-Disposition'] = f'inline; filename="{filename}"'
    
    return response


class FileUploadView(APIView):
    """
    API view for handling file uploads with proper validation.
    """
    permission_classes = [IsAuthenticated]
    
    def post(self, request, format=None):
        from keralatechreach.file_handling import get_file_validator
        
        if 'file' not in request.FILES:
            return Response({'error': 'No file provided'}, status=status.HTTP_400_BAD_REQUEST)
            
        file = request.FILES['file']
        category = request.data.get('category', 'default')
        
        # Validate file
        validator = get_file_validator(category)
        try:
            validator(file)
        except Exception as e:
            return Response({'error': str(e)}, status=status.HTTP_400_BAD_REQUEST)
        
        # Process the file
        # This is where you would save the file and create a database record
        # Example: model_instance.file_field = file
        # model_instance.save()
        
        return Response({'message': 'File uploaded successfully'}, status=status.HTTP_201_CREATED)


@method_decorator(login_required, name='dispatch')
class QuestionPaperView(View):
    """
    View to serve question papers with authorization checks.
    """
    def get(self, request, question_id):
        from keralatechreach.models import Question
        try:
            question = Question.objects.get(id=question_id)
            if not question.file:
                raise Http404("File not available")
                
            # Return the file
            return serve_protected_file(request, question.file)
        except Question.DoesNotExist:
            raise Http404("Question not found")


@method_decorator(login_required, name='dispatch')
class NotesView(View):
    """
    View to serve uploaded notes with authorization checks.
    """
    def get(self, request, notes_id):
        from keralatechreach.models import NotesUpload
        try:
            notes = NotesUpload.objects.get(id=notes_id)
            if not notes.file_path:
                raise Http404("File not available")
                
            # Return the file
            return serve_protected_file(request, str(notes.file_path))
        except NotesUpload.DoesNotExist:
            raise Http404("Notes not found") 