from django.db import models


class UserInfo(models.Model):
    uname = models.CharField(max_length=20, verbose_name='用户名')
    upwd = models.CharField(max_length=40, verbose_name='密码')
    umail = models.CharField(max_length=40, verbose_name='邮箱')
    ushouhuo = models.CharField(max_length=20, verbose_name='收货人', default='')
    uaddress = models.CharField(max_length=100, verbose_name='收货地址', default='')
    upostcode = models.CharField(max_length=8, verbose_name='邮政编码', default='')
    uphone = models.CharField(max_length=15, verbose_name='联系电话', default='')

    def __str__(self):
        return self.uname.__repr__()







