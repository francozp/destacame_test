from rest_framework import serializers  

from .models import Buses

class BusSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Buses
        fields = ('id_bus','asientos')
