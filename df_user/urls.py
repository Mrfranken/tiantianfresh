from django.conf.urls import url, include
from . import views

urlpatterns = [
    url('^register/$', views.register),
    url('^register_handle/$', views.register_handle),
    url('^login/$', views.login)
]