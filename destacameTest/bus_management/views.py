from django.shortcuts import render, get_object_or_404
from django.views.generic import TemplateView
from django.db.models import Avg
from rest_framework import viewsets
from rest_framework import status
from rest_framework.authentication import BasicAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.decorators import action

from .models import Buses, Passengers, Drivers, Courses, Trips
from .serializers import (BusSerializer, PassengerSerializer, CourseSerializer,
                          TripSerializer, DriverSerializer)


class IndexView(TemplateView):
    template_name = "core/index.html"


class BusViewSet(viewsets.ModelViewSet):
    authentification_classes = (BasicAuthentication,)
    permission_classes = (IsAuthenticated,)
    queryset = Buses.objects.all()
    serializer_class = BusSerializer


class PassengerViewSet(viewsets.ModelViewSet):
    authentification_classes = (BasicAuthentication,)
    permission_classes = (IsAuthenticated,)
    serializer_class = PassengerSerializer
    queryset = Passengers.objects.all()


class CourseViewSet(viewsets.ModelViewSet):
    authentification_classes = (BasicAuthentication,)
    permission_classes = (IsAuthenticated,)
    queryset = Courses.objects.all()
    serializer_class = CourseSerializer

    @action(detail=False)
    def get_origins(self, request):
        origins = Courses.objects.all().values('origin').distinct()
        return Response(origins)

    @action(detail=False)
    def get_destinations(self, request, origin=None):
        origin = request.query_params.get('origin')
        courses = Courses.objects.filter(origin=origin)
        serializer = self.get_serializer(courses, many=True)
        return Response(serializer.data)


class TripViewSet(viewsets.ModelViewSet):
    authentification_classes = (BasicAuthentication,)
    permission_classes = (IsAuthenticated,)
    queryset = Trips.objects.all()
    serializer_class = TripSerializer

    @action(detail=False)
    def get_trips_mean(self, request):
        trips = Trips.objects.values('course_id').annotate(Avg('seats_taken'))
        return Response(trips)

    @action(detail=False)
    def get_bus_capacity(self, request, course_id=None, N=None):
        course_id = request.query_params.get('course_id')
        N = request.query_params.get('N')
        buses = Trips.objects.filter(course_id=course_id).filter(seats_taken__gt=N).values('bus_id')
        print(buses)
        return Response(buses)


class DriverViewSet(viewsets.ModelViewSet):
    authentification_classes = (BasicAuthentication,)
    permission_classes = (IsAuthenticated,)
    queryset = Drivers.objects.all()
    serializer_class = DriverSerializer
