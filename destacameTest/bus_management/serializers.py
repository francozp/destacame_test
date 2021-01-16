from rest_framework import serializers

from .models import Buses, Passengers, Drivers, Courses, Trips


class BusSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Buses
        fields = ('bus_id', 'seats')


class PassengerSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Passengers
        fields = ('rut', 'name', 'lastname', 'birthday')


class DriverSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Drivers
        fields = ('rut', 'name', 'lastname', 'birthday')


class CourseSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Courses
        fields = ('course_id','origin','destination')


class TripSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Trips
        fields = ('trip_id','driver_rut','course_id','bus_id', 'departure_time', 'seats_taken')