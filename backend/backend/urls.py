from django.urls import include, path
from blooms_app.views import FarmViewset
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r'farms', FarmViewset)

urlpatterns = [
    path('api/', include(router.urls)),
]