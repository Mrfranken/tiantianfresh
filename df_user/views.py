# -*- coding: utf-8 -*-
from django.shortcuts import render, HttpResponse, redirect, HttpResponseRedirect, render_to_response
from django.http import JsonResponse
from .models import *
from df_goods.models import GoodsInfo
from hashlib import md5
from .islogin import is_login


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
    #这个请求从js从发过来tiantianfresh\static\js\register.js
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
    print('remember is :', remember, type(remember))
    user = UserInfo.objects.filter(uname=username).first()
    if user:
        verify_pwd = md5(pwd.encode('utf-8')).hexdigest()
        if verify_pwd == user.upwd:
            url = request.COOKIES.get('url', '')
            print('url is: ', url)
            if url:
                resp = HttpResponseRedirect(url)
            else:
                resp = HttpResponseRedirect('/user/user_info/')
            if remember == 1:
                resp.set_cookie('uname', username, -1)
            else:
                resp.set_cookie('uname', '')
            request.session['user_id'] = user.id
            request.session['user_name'] = user.uname
            request.session.set_expiry(600)
            print("full path: ", request.get_full_path)
            return resp
        else:
            context = {'title': '用户登录', 'error_name': 0, 'error_pwd': 1, 'uname': username, 'upwd': pwd}
            return render(request, 'df_user/login.html', context=context)
    else:
        context = {'title': '用户登录', 'error_name': 1, 'error_pwd': 0, 'uname': username}
        if remember != 1:
            context.pop('uname')
        return render(request, 'df_user/login.html', context=context)


@is_login
def user_info(request):
    current_user = UserInfo.objects.filter(id=request.session['user_id']).first()

    recent_viewed_goods = request.COOKIES.get('recent_viewed_goods', '')
    print('recent_viewed_goods: ', recent_viewed_goods)
    goods_objects = list()
    if recent_viewed_goods:
        for good_id in recent_viewed_goods.split(','):
            goods_objects.append(GoodsInfo.objects.filter(pk=int(good_id)).first())

    context = {
        'user_name': current_user.uname,
        'uphone': current_user.umail,
        'title': u'用户中心',
        'page_name': 1,
        'guest_cart': 0,
        'recent_viewed_goods': goods_objects
    }
    return render(request, 'df_user/user_center_info.html', context=context)


@is_login
def user_order(request):

    context = {"title": "用户订单",
               "page_name": 1,
               "guest_cart": 0}
    return render(request, 'df_user/user_center_order.html', context=context)


@is_login
def user_site(request):
    # ushouhuo = models.CharField(max_length=20, verbose_name='收货人', default='')
    # uaddress = models.CharField(max_length=100, verbose_name='收货地址', default='')
    # upostcode = models.CharField(max_length=8, verbose_name='邮政编码', default='')
    # uphone = models.CharField(max_length=15, verbose_name='联系电话', default='')
    current_user = UserInfo.objects.filter(id=request.session['user_id']).first()
    if request.method == 'POST':
        post = request.POST
        current_user.ushouhuo = post.get('receiver')
        current_user.uaddress = post.get('address')
        current_user.upostcode = post.get('postcode')
        current_user.uphone = post.get('phonenumber')
        current_user.save()

    context = {'title': "收货地址管理",
               'user': current_user,
               "page_name": 1,
               "guest_cart": 0}
    return render(request, 'df_user/user_center_site.html', context=context)


def logout(request):
    request.session.flush()
    return HttpResponseRedirect('/goods/')
