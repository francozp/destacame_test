from rest_framework import serializers

from .models import Buses, Passengers, Drivers, Courses, Trips, PassengerSeats


class BusSerializer(serializers.ModelSerializer):
    """Buses Model Serializer that allows
    Django iteraction with Vue.js.
    """
    class Meta:
        model = Buses
        fields = ('bus_id', 'seats')


class PassengerSerializer(serializers.ModelSerializer):
    """Passenger Model Serializer that allows
    Django iteraction with Vue.js.
    """
    class Meta:
        model = Passengers
        fields = ('rut', 'name', 'lastname', 'birthday')


class DriverSerializer(serializers.ModelSerializer):
    """Drivers Model Serializer that allows
    Django iteraction with Vue.js.
    """
    class Meta:
        model = Drivers
        fields = ('rut', 'name', 'lastname', 'birthday')


class CourseSerializer(serializers.ModelSerializer):
    """Courses Model Serializer that allows
    Django iteraction with Vue.js.
    """
    class Meta:
        model = Courses
        fields = ('course_id', 'origin', 'destination')


class PassengerSeatsSerializer(serializers.ModelSerializer):
    """PassengerSeats Model Serializer that allows
    Django iteraction with Vue.js.

    Passenger rut and trip fields are declared as
    PrimaryKeyRelatedField because they are foreign keys for Trips Model.
    """
    passenger_rut = serializers.PrimaryKeyRelatedField(
                queryset=Passengers.objects.all()
                )
    trip = serializers.PrimaryKeyRelatedField(queryset=Trips.objects.all())

    class Meta:
        model = PassengerSeats
        fields = ('trip', 'passenger_rut', 'seat')


class TripSerializer(serializers.ModelSerializer):
    """Trips Model Serializer that allows Django iteraction with
    Vue.js.

    Driver, course and bus fields are declared as
    PrimaryKeyRelatedField because they are foreign keys for Trips Model.
    """
    driver = serializers.PrimaryKeyRelatedField(queryset=Drivers.objects.all())
    course = serializers.PrimaryKeyRelatedField(queryset=Courses.objects.all())
    bus = serializers.PrimaryKeyRelatedField(queryset=Buses.objects.all())

    class Meta:
        model = Trips
        fields = ('trip_id', 'driver', 'course', 'bus', 'departure_time', 'departure_date', 'seats_taken')
