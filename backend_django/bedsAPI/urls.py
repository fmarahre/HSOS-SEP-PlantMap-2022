from django.urls import path

from . import views

urlpatterns = [
    path('beds/', views.beds, name='beds'),
    path('beds/<int:id>/', views.bedsId, name="bedsId"),
]
