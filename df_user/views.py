from django.shortcuts import render, HttpResponse, redirect, HttpResponseRedirect
from django.http import JsonResponse
from .models import *
from hashlib import md5


# Create your views here.
def register(request):
    context = {'title': '注册用户', 'title1': '注册用户'}
    return render(request, 'df_user/register.html', context=context)


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
    username = request.COOKIES.get('uname', '')
    context = {'title': '用户登录', 'error_name': 0, 'error_pwd': 0, 'uname': username}
    return render(request, 'df_user/login.html', context=context)


def register_user_exist(request):
    user_name = request.GET.get('uname')
    print('user_name: ', user_name)
    num = UserInfo.objects.filter(uname=user_name).count()
    print('num: ', num)
    return JsonResponse({'count': num})


def login_handle(request):
    post = request.POST
    username = post.get('username')
    pwd = post.get('pwd')
    remember = int(post.get('remember', 0))
    # print('remember is :', remember, type(remember))
    user = UserInfo.objects.filter(uname=username)
    if user:
        verify_pwd = md5(pwd.encode('utf-8')).hexdigest()
        if verify_pwd == user[0].upwd:
            resp = HttpResponseRedirect('/user/user_info/')
            if remember == 1:
                resp.set_cookie('uname', username)
            else:
                resp.set_cookie('uname', '', max_age=-1)
            return resp
        else:
            context = {'title': '用户登录', 'error_name': 0, 'error_pwd': 1, 'uname': username}
            return render(request, 'df_user/login.html', context=context)
    else:
        context = {'title': '用户登录', 'error_name': 1, 'error_pwd': 0}
        return render(request, 'df_user/login.html', context=context)


def user_info(request):
    return render(request, 'df_user/user_center_info.html')

