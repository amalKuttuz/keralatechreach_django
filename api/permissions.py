# api/permissions.py
from rest_framework.permissions import BasePermission
from .auth import validate_api_key

class HasValidAPIKey(BasePermission):
    def has_permission(self, request, view):
        return validate_api_key(request)
