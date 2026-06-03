from django.urls import path
from . import views

urlpatterns = [

    path(
        '',
        views.home,
        name='home'
    ),

    path(
        'passenger/',
        views.passenger,
        name='passenger'
    ),

    path(
        'booking/',
        views.booking,
        name='booking'
    ),

    path(
        'flights/',
        views.flights,
        name='flights'
    ),

    path(
        'dashboard/',
        views.dashboard,
        name='dashboard'
    ),

    path(
        'analytics/',
        views.analytics,
        name='analytics'
    ),
]