from django.conf.urls import url, include
from . import views

urlpatterns = [
    url('^register/$', views.register),
    url('^register_handle/$', views.register_handle),
    url('^login/$', views.login),
    url('^register_user_exist/$', views.register_user_exist),
    url('^register_user_exist1/()$', views.register_user_exist),
    url('^login_handle/$', views.login_handle),
    url('^user_info/$', views.user_info),
    url('^user_order/$', views.user_order),
    url('^user_site/$', views.user_site),#user_site,
    url('^logout/$', views.logout)
]
