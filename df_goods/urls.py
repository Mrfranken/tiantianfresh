from django.conf.urls import include, url
from . import views


urlpatterns = [
    url(r'^$', views.index),
    url(r'^list(\d+)_(\d+)_(\d+)/$', views.good_list),
    url(r'^detail/(\d+)/$', views.detail)
]
