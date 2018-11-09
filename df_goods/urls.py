from django.conf.urls import include, url
from . import views


urlpatterns = [
    url(r'^$', views.index),
    url(r'^list/$', views.good_list),
    url(r'^detail/$', views.detail)
]
