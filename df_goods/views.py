from django.shortcuts import render, HttpResponseRedirect, redirect
from .models import GoodCategory, GoodsInfo
from django.core.paginator import Paginator


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


def good_list(request, category_id, page_id, sort_way):
    category_id, page_id, sort_way = int(category_id), int(page_id), int(sort_way)
    current_category = GoodCategory.objects.filter(id=category_id).first()
    new_goods = current_category.goodsinfo_set.order_by('-id')[:2]
    if sort_way == 1:
        goods_list = current_category.goodsinfo_set.order_by('-id')
    elif sort_way == 2:
        goods_list = current_category.goodsinfo_set.order_by('gprice')
    elif sort_way == 3:
        goods_list = current_category.goodsinfo_set.order_by('gclick')

    paginator = Paginator(goods_list, 3)
    list_good = paginator.page(page_id)
    page_range = paginator.page_range


    context = {
        'page_num': 0,
        'guest_cart': 1,
        'category_id': category_id,
        'page_id': page_id,
        'sort_way': sort_way,
        'new_goods': new_goods,
        'list_good': list_good,
        'page_id': page_id,
        'page_range': page_range,
    }
    return render(request, 'df_goods/list.html', context=context)


def detail(request, good_id):
    good_id = int(good_id)
    good_info = GoodsInfo.objects.filter(id=good_id).first()
    good_info.gclick += 1
    good_info.save()

    two_new_goods = good_info.gtype.goodsinfo_set.order_by('-id')[:2]
    context = {
        'page_num': 0,
        'guest_cart': 1,
        'good_info': good_info,
        'two_new_goods': two_new_goods
    }
    return render(request, 'df_goods/detail.html', context=context)
