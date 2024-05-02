from django.urls import include, path
from blooms_app.views import FarmViewset
from rest_framework.routers import DefaultRouter
from django.contrib import admin

router = DefaultRouter()
router.register(r'farms', FarmViewset)

urlpatterns = [
    path('api/', include(router.urls)),
    path('bloomsai/',include('blooms_app.urls')),
    path('account/',include('account.urls')),
    path('admin/', admin.site.urls),

]
