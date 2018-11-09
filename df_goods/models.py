from django.db import models
from tinymce.models import HTMLField


class GoodCategory(models.Model):
    category = models.CharField(max_length=30, verbose_name='种类')
    is_delete = models.BooleanField(default=False, verbose_name='是否删除')

    def __str__(self):
        return str(self.category)

    # def _category(self):
    #     return self.category
    #
    # _category.short_description = '种类'

    class Meta:
        verbose_name_plural = '商品种类'

class GoodsInfo(models.Model):
    gtitle = models.CharField(max_length=20, verbose_name='品名')
    gpic = models.ImageField(upload_to='df_goods', verbose_name='图片', null=True, blank=True)
    gprice = models.DecimalField(max_digits=7, decimal_places=2, verbose_name='单价')
    is_delete = models.BooleanField(default=False, verbose_name="是否删除")
    gunit = models.CharField(max_length=20, verbose_name="单位重量", null=True, blank=True)
    gclick = models.IntegerField(verbose_name='点击量', default=0)
    gintro = models.CharField(max_length=200, verbose_name='简介', null=True, blank=True)
    ginventory = models.IntegerField(verbose_name='库存', default=0)
    gcontent = HTMLField(verbose_name='详细内容', null=True, blank=True)
    gadv = models.BooleanField(default=False, verbose_name='推荐')
    gtype = models.ForeignKey(GoodCategory)

    def __str__(self):
        return str(self.gtitle)

    class Meta:
        verbose_name_plural = '商品信息'


