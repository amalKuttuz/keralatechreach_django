"""
ASGI config for keralatechreach project.

It exposes the ASGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/5.2/howto/deployment/asgi/
"""

import os
import django
from django.core.asgi import get_asgi_application
from channels.routing import ProtocolTypeRouter, URLRouter
from channels.auth import AuthMiddlewareStack

# Set up Django ASGI application early to ensure the AppRegistry is populated
# before importing code that may import ORM models.
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'keralatechreach.settings')
django.setup()

# Import after django.setup() to avoid AppRegistryNotReady exception
from admindashboard.routing import websocket_urlpatterns

application = ProtocolTypeRouter({
    "http": get_asgi_application(),
    "websocket": AuthMiddlewareStack(
        URLRouter(websocket_urlpatterns)
    ),
})
