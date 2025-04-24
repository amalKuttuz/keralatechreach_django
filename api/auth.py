
import os

VALID_API_KEY = os.getenv('API_SECRET_KEY')  # Reads from environment

def validate_api_key(request):
    return request.query_params.get('api_key') == VALID_API_KEY
