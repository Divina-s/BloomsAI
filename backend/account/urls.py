from django.urls import path

from .views import UserSignup, UserLogin, UserLogout, forgot_password
from . import views

urlpatterns = [
    path('api/signup/', UserSignup.as_view(), name='user_signup'),
    path('api/login/', UserLogin.as_view(), name='user_login'),
    path('api/logout/', UserLogout.as_view(), name='user_logout'),
    path('api/forgot-password/', views.forgot_password, name='forgot_password'),
    path('api/verify-code/', views.verify_code, name='verify_code'),
    path('api/change-password/', views.change_password, name='change_password'),
    path('api/complete-profile/', views.complete_profile, name='complete_profile'),
    path('forgot-password/', forgot_password, name='forgot_password'),
]


