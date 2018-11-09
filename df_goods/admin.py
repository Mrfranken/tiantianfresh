from django.contrib import admin
from .models import GoodCategory, GoodsInfo


@admin.register(GoodsInfo)
class GoodsInfoAdmin(admin.ModelAdmin):
    list_per_page = 15
    list_display = ['id', 'gtitle', 'gprice', 'gtitle', 'ginventory', 'gcontent', 'gtype']


class GoodsInfoInline(admin.StackedInline):
    model = GoodsInfo
    extra = 3


@admin.register(GoodCategory)
class GoodCategoryAdmin(admin.ModelAdmin):
    list_display = ['id', 'category']
    inlines = [GoodsInfoInline]

# admin.site.register(GoodCategory)
# admin.site.register(GoodsInfo)




