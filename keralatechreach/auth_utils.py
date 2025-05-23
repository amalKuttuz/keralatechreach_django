import hashlib
import binascii
import os
import bcrypt
from django.contrib.auth.models import User
from django.utils import timezone
from django.db import transaction
from django.contrib.auth import get_user_model
from keralatechreach.models import User as LegacyUser
from admindashboard.models import UserProfile

def verify_php_password(password, stored_hash):
    """
    Verify if a plain-text password matches the stored hash from PHP.
    PHP typically uses md5, SHA-1 or bcrypt for password hashing.
    
    Args:
        password (str): The plain-text password to verify
        stored_hash (str): The hash from PHP
        
    Returns:
        bool: True if the password matches, False otherwise
    """
    # Check if it's an MD5 hash (32 characters)
    if len(stored_hash) == 32:
        hashed = hashlib.md5(password.encode()).hexdigest()
        return hashed == stored_hash
    
    # Check if it's a SHA-1 hash (40 characters)
    elif len(stored_hash) == 40:
        hashed = hashlib.sha1(password.encode()).hexdigest()
        return hashed == stored_hash
    
    # Check if it's a bcrypt hash (typically starts with $2y$ or $2a$)
    elif stored_hash.startswith(('$2y$', '$2a$')):
        # Convert PHP bcrypt hash format to Python compatible format
        if stored_hash.startswith('$2y$'):
            # Replace $2y$ with $2b$ for Python's bcrypt
            normalized_hash = stored_hash.replace('$2y$', '$2b$')
        else:
            normalized_hash = stored_hash
        
        # Verify with bcrypt
        try:
            return bcrypt.checkpw(password.encode(), normalized_hash.encode())
        except ValueError:
            # If there's an encoding error, fall back to direct comparison
            return False
    
    # Unknown hash format, return False
    return False


def migrate_legacy_user(legacy_user_id, new_password=None):
    """
    Migrate a legacy user from the old PHP system to the Django auth system.
    
    Args:
        legacy_user_id (int): The ID of the legacy user to migrate
        new_password (str, optional): If provided, set this password instead of migrating
                                     the old hash
    
    Returns:
        User: The Django User instance, or None if migration failed
    """
    try:
        legacy_user = LegacyUser.objects.get(id=legacy_user_id)
        
        # Check if user already exists
        user_exists = User.objects.filter(username=legacy_user.userid).exists()
        if user_exists:
            user = User.objects.get(username=legacy_user.userid)
            print(f"User {legacy_user.userid} already exists in the Django auth system.")
            return user
            
        # Create a new user in Django auth system
        with transaction.atomic():
            # Create Django auth user
            user = User.objects.create(
                username=legacy_user.userid,
                date_joined=timezone.now(),
                is_active=True
            )
            
            # Set password
            if new_password:
                # If a new password is provided, use it
                user.set_password(new_password)
            else:
                # Store the legacy password hash directly in the user object
                # Django will handle the authentication through custom backend
                user.password = f"legacy${legacy_user.password}"
            
            user.save()
            
            # Create or update user profile
            profile, created = UserProfile.objects.get_or_create(
                user=user,
                defaults={
                    'email': f"{legacy_user.userid}@example.com",  # Placeholder
                    'is_legacy_user': True,
                    'legacy_id': legacy_user.id
                }
            )
            
            return user
            
    except LegacyUser.DoesNotExist:
        print(f"Legacy user with ID {legacy_user_id} not found.")
        return None
    except Exception as e:
        print(f"Error migrating legacy user: {e}")
        return None


def migrate_all_users(set_new_password=None):
    """
    Migrate all users from the legacy system to Django auth system.
    
    Args:
        set_new_password (str, optional): If provided, set this password for all migrated users
        
    Returns:
        tuple: (success_count, fail_count, error_details)
    """
    legacy_users = LegacyUser.objects.all()
    success_count = 0
    fail_count = 0
    error_details = []
    
    for legacy_user in legacy_users:
        try:
            user = migrate_legacy_user(legacy_user.id, set_new_password)
            if user:
                success_count += 1
            else:
                fail_count += 1
                error_details.append(f"Failed to migrate user {legacy_user.userid}")
        except Exception as e:
            fail_count += 1
            error_details.append(f"Error migrating user {legacy_user.userid}: {str(e)}")
    
    return success_count, fail_count, error_details


class LegacyPasswordBackend:
    """
    Authentication backend for verifying passwords from the legacy PHP system.
    This should be added to AUTHENTICATION_BACKENDS setting.
    """
    
    def authenticate(self, request, username=None, password=None):
        """
        Authenticate a user with legacy password hash.
        
        Args:
            request: The request object
            username (str): The username to authenticate
            password (str): The password to verify
            
        Returns:
            User: The Django User instance if authenticated, None otherwise
        """
        User = get_user_model()
        
        try:
            user = User.objects.get(username=username)
            
            # Check if this is a legacy password
            if user.password.startswith('legacy$'):
                legacy_hash = user.password[7:]  # Remove 'legacy$' prefix
                if verify_php_password(password, legacy_hash):
                    # Update to Django's password format
                    user.set_password(password)
                    user.save()
                    return user
                return None
                
            # Regular Django authentication
            return None
            
        except User.DoesNotExist:
            # Try to find a legacy user and migrate on-the-fly
            try:
                legacy_user = LegacyUser.objects.get(userid=username)
                if verify_php_password(password, legacy_user.password):
                    # Migrate user if password is correct
                    user = migrate_legacy_user(legacy_user.id, password)
                    return user
                return None
            except LegacyUser.DoesNotExist:
                return None
    
    def get_user(self, user_id):
        User = get_user_model()
        try:
            return User.objects.get(pk=user_id)
        except User.DoesNotExist:
            return None


def create_test_user(username, password, email=None, is_staff=False, is_superuser=False):
    """
    Create a test user in the Django auth system.
    
    Args:
        username (str): The username
        password (str): The password
        email (str, optional): The email address
        is_staff (bool): Whether the user is staff
        is_superuser (bool): Whether the user is a superuser
        
    Returns:
        User: The Django User instance
    """
    User = get_user_model()
    
    # Check if user already exists
    if User.objects.filter(username=username).exists():
        return User.objects.get(username=username)
        
    # Create new user
    with transaction.atomic():
        user = User.objects.create(
            username=username,
            email=email or f"{username}@example.com",
            is_staff=is_staff,
            is_superuser=is_superuser,
            is_active=True
        )
        user.set_password(password)
        user.save()
        
        # Create profile
        UserProfile.objects.get_or_create(
            user=user,
            defaults={'email': user.email}
        )
        
        return user 