from django.shortcuts import render
from django.views.generic import TemplateView

from rest_framework import viewsets
from rest_framework.authentication import BasicAuthentication
from rest_framework.permissions import IsAuthenticated

from .serializers import BusSerializer
from .models import Buses


class IndexView(TemplateView):
    template_name = "core/index.html"


class BusViewSet(viewsets.ModelViewSet):
    authentification_classes = (BasicAuthentication,)
    permission_classes = (IsAuthenticated,)
    queryset = Buses.objects.all()
    serializer_class = BusSerializer
