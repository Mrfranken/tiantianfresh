from django.shortcuts import render, HttpResponse, redirect
from .models import *
from hashlib import md5

# Create your views here.
def register(request):
    return render(request, 'df_user/register.html')

def register_handle(request):
    post = request.POST
    uname = post.get('user_name')
    pwd = post.get('pwd')
    cpwd = post.get('cpwd')
    email = post.get('email')

    if pwd != cpwd:
        return redirect('/user/register/')

    epwd = md5(pwd.encode('utf-8')).hexdigest()

    user_info = UserInfo()
    user_info.uname = uname
    user_info.upwd = epwd
    user_info.umail = email
    user_info.save()

    return redirect('/user/login/')

def login(request):
    return render(request, 'df_user/login.html')




