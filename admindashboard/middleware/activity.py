from django.urls import resolve
from ..monitoring.services import ActivityMonitor
import logging

logger = logging.getLogger(__name__)

class UserActivityMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        response = self.get_response(request)
        
        try:
            if hasattr(request, 'user') and request.user.is_authenticated:
                # Get the current URL name
                current_url = resolve(request.path_info)
                url_name = f"{current_url.app_name}:{current_url.url_name}" if current_url.url_name else request.path
                
                # Determine the action based on the request method
                action_map = {
                    'GET': 'view',
                    'POST': 'create',
                    'PUT': 'update',
                    'PATCH': 'update',
                    'DELETE': 'delete'
                }
                action = action_map.get(request.method, 'view')
                
                # Log the activity
                ActivityMonitor.log_activity(
                    user=request.user,
                    action=action,
                    resource=url_name,
                    request=request,
                    extra_data={
                        'status_code': response.status_code,
                        'method': request.method,
                    }
                )
        except Exception as e:
            logger.error(f"Error logging user activity: {str(e)}")
        
        return response 