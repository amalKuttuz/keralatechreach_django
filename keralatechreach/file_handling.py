import os
import random
import string
import time
from datetime import datetime
from django.conf import settings
from django.core.exceptions import ValidationError
from django.utils.deconstruct import deconstructible


# Directory structure for uploaded files
FILE_UPLOAD_DIRS = {
    'question_papers': 'questions',
    'notes': 'notes_upload',
    'gallery': 'gallery',
    'news': 'news',
    'profiles': 'profiles',
    'initiatives': 'initiatives'
}

# Maximum file size (10 MB)
MAX_UPLOAD_SIZE = 10 * 1024 * 1024  # 10MB

# Allowed file types by category
ALLOWED_FILE_TYPES = {
    'question_papers': ['.pdf'],
    'notes': ['.pdf', '.doc', '.docx', '.ppt', '.pptx', '.txt'],
    'gallery': ['.jpg', '.jpeg', '.png', '.gif'],
    'news': ['.jpg', '.jpeg', '.png'],
    'profiles': ['.jpg', '.jpeg', '.png'],
    'initiatives': ['.jpg', '.jpeg', '.png']
}

@deconstructible
class FileValidator:
    """
    Validator for files, checking for size and extension.
    """
    def __init__(self, max_size=None, allowed_extensions=None):
        self.max_size = max_size
        self.allowed_extensions = allowed_extensions

    def __call__(self, file):
        if self.max_size is not None and file.size > self.max_size:
            raise ValidationError(f"File size must not exceed {self.max_size / (1024 * 1024):.1f} MB.")

        if self.allowed_extensions is not None:
            ext = os.path.splitext(file.name)[1].lower()
            if ext not in self.allowed_extensions:
                raise ValidationError(
                    f"File extension '{ext}' is not allowed. "
                    f"Allowed extensions are: {', '.join(self.allowed_extensions)}"
                )


def generate_unique_filename(instance, filename, category):
    """
    Generate a unique filename for uploaded files following PHP's pattern:
    [type]_[hexadecimal timestamp]_[date].ext
    """
    # Get file extension
    ext = os.path.splitext(filename)[1].lower()
    
    # Generate timestamp components
    hex_timestamp = format(int(time.time()), 'x')  # Hexadecimal timestamp
    date_str = datetime.now().strftime("%Y%m%d")  # Current date in YYYYMMDD format

    # Determine file type prefix based on category
    if category == 'question_papers':
        prefix = 'paper'
    elif category == 'notes':
        prefix = 'note'
    elif category == 'gallery':
        prefix = 'gallery'
    elif category == 'news':
        prefix = 'news'
    elif category == 'profiles':
        prefix = 'profile'
    elif category == 'initiatives':
        prefix = 'initiative'
    else:
        prefix = 'file'

    # Create the filename
    unique_filename = f"{prefix}_{hex_timestamp}_{date_str}{ext}"
    
    # Get the appropriate upload directory
    upload_dir = FILE_UPLOAD_DIRS.get(category, '')
    
    # Return the relative path to store in the model
    return os.path.join(upload_dir, unique_filename)


def sanitize_filename(filename):
    """
    Sanitize a filename to remove potentially dangerous characters
    """
    # Replace spaces with underscores
    filename = filename.replace(' ', '_')
    
    # Keep only alphanumeric characters, underscores, hyphens, and periods
    allowed_chars = string.ascii_letters + string.digits + '_-.'
    filename = ''.join(c for c in filename if c in allowed_chars)
    
    return filename


def get_file_validator(category):
    """
    Return a FileValidator for the specified category
    """
    allowed_extensions = ALLOWED_FILE_TYPES.get(category, ['.pdf'])
    return FileValidator(max_size=MAX_UPLOAD_SIZE, allowed_extensions=allowed_extensions)


def get_upload_path(instance, filename, category):
    """
    Helper function to get the upload path for a file
    """
    # Sanitize the filename first
    filename = sanitize_filename(filename)
    
    # Generate a unique filename
    return generate_unique_filename(instance, filename, category)


def question_paper_upload_path(instance, filename):
    """
    Return the upload path for question papers
    """
    return get_upload_path(instance, filename, 'question_papers')


def notes_upload_path(instance, filename):
    """
    Return the upload path for notes
    """
    return get_upload_path(instance, filename, 'notes')


def gallery_upload_path(instance, filename):
    """
    Return the upload path for gallery images
    """
    return get_upload_path(instance, filename, 'gallery')


def news_image_upload_path(instance, filename):
    """
    Return the upload path for news images
    """
    return get_upload_path(instance, filename, 'news')


def profile_picture_upload_path(instance, filename):
    """
    Return the upload path for profile pictures
    """
    return get_upload_path(instance, filename, 'profiles')


def initiative_image_upload_path(instance, filename):
    """
    Return the upload path for initiative images
    """
    return get_upload_path(instance, filename, 'initiatives') 