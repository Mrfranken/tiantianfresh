from django.shortcuts import render, HttpResponseRedirect, redirect
from .models import GoodCategory, GoodsInfo


def index(request):
    good_category = GoodCategory.objects.all()
    fruit = good_category[0].goodsinfo_set.order_by('-id')[:4]
    rfruit = good_category[0].goodsinfo_set.order_by('-gclick')[:4]

    fish = good_category[1].goodsinfo_set.order_by('-id')[:4]
    rfish = good_category[1].goodsinfo_set.order_by('-gclick')[:4]

    meat = good_category[2].goodsinfo_set.order_by('-id')[:4]
    rmeat = good_category[2].goodsinfo_set.order_by('-gclick')[:4]

    egg = good_category[3].goodsinfo_set.order_by('-id')[:4]
    regg = good_category[3].goodsinfo_set.order_by('-gclick')[:4]

    vagetables = good_category[4].goodsinfo_set.order_by('-id')[:4]
    rvagetables = good_category[4].goodsinfo_set.order_by('-gclick')[:4]

    frozen = good_category[5].goodsinfo_set.order_by('-id')[:4]
    rfrozen = good_category[5].goodsinfo_set.order_by('-gclick')[:4]

    context = {
        'title': '首页',
        'fruit': fruit, 'rfruit': rfruit,
        'fish': fish, 'rfish': rfish,
        'meat': meat, 'rmeat': rmeat,
        'egg': egg, 'regg': regg,
        'vagetables': vagetables, 'rvagetables': rvagetables,
        'frozen': frozen, 'rfrozen': rfrozen,
        'guest_cart': 1, 'page_name': 0
    }
    return render(request, 'df_goods/index.html', context=context)


def good_list(request):
    return render(request, 'df_goods/list.html')


def detail(request):
    return render(request, 'df_goods/detail.html')
