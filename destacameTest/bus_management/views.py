import math

from django.shortcuts import render, get_object_or_404
from django.views.generic import TemplateView
from django.db.models import Avg
from rest_framework import viewsets
from rest_framework import status
from rest_framework.authentication import BasicAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.decorators import action

from .models import Buses, Passengers, Drivers, Courses, Trips, PassengerSeats
from .serializers import (BusSerializer, PassengerSerializer, CourseSerializer,
                          TripSerializer, DriverSerializer,
                          PassengerSeatsSerializer)


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
        for trip in trips:
            trip["percentage"] = 0
        return Response(trips)

    @action(detail=False)
    def get_bus_capacity(self, request, course_id=None, N=None):
        course_id = request.query_params.get('course_id')
        N = math.floor(float(request.query_params.get('N')))
        buses = Trips.objects.filter(course_id=course_id).filter(seats_taken__gt=N).values('bus_id')
        return Response(buses)

    @action(detail=False)
    def get_trips(self, request, course=None, date=None):
        course_id = request.query_params.get('course')
        date = request.query_params.get('date')
        trips = Trips.objects.filter(course_id=course_id, departure_date=date)
        serializer = self.get_serializer(trips, many=True)
        return Response(serializer.data)

    @action(detail=False)
    def add_seat(self, request, trip_id=None):
        trip_id = request.query_params.get('trip_id')
        queryset = Trips.objects.filter(trip_id=trip_id)
        trip = queryset[0]
        trip.seats_taken = trip.seats_taken + 1
        trip.save()
        return Response('')


class DriverViewSet(viewsets.ModelViewSet):
    authentification_classes = (BasicAuthentication,)
    permission_classes = (IsAuthenticated,)
    queryset = Drivers.objects.all()
    serializer_class = DriverSerializer


class PassengerSeatsViewSet(viewsets.ModelViewSet):
    authentification_classes = (BasicAuthentication,)
    permission_classes = (IsAuthenticated,)
    queryset = PassengerSeats.objects.all()
    serializer_class = PassengerSeatsSerializer

    def list(self, request, trip_id=None):
        trip_id = request.query_params.get('trip_id')
        queryset = PassengerSeats.objects.filter(trip_id=trip_id)
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

    @action(detail=False)
    def get_seats(self, request, trip_id=None):
        trip_id = request.query_params.get('trip_id')
        queryset = PassengerSeats.objects.filter(trip_id=trip_id)
        seats_layout = [[{"seat": 0, "state": 0}, {"seat": 1, "state": 0}],
                        [{"seat": 2, "state": 0}, {"seat": 3, "state": 0}],
                        [{"seat": 4, "state": 0}, {"seat": 5, "state": 0}],
                        [{"seat": 6, "state": 0}, {"seat": 7, "state": 0}],
                        [{"seat": 8, "state": 0}, {"seat": 9, "state": 0}]
                        ]
        for passengerSeat in queryset:
            seat = passengerSeat.seat
            if(passengerSeat.seat % 2):
                row = int((passengerSeat.seat - 1)/2)
                seats_layout[row][1]["state"] = -1
            else:
                row = int(passengerSeat.seat/2)
                seats_layout[row][0]["state"] = -1
        return Response(seats_layout)
