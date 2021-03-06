# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-10-24 06:18
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='UserInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('uname', models.CharField(max_length=20, verbose_name='用户名')),
                ('upwd', models.CharField(max_length=40, verbose_name='密码')),
                ('umail', models.CharField(max_length=40, verbose_name='邮箱')),
                ('ushouhuo', models.CharField(max_length=20, verbose_name='收货人')),
                ('uaddress', models.CharField(max_length=100, verbose_name='收货地址')),
                ('upostcode', models.CharField(max_length=8, verbose_name='邮政编码')),
                ('uphone', models.CharField(max_length=15, verbose_name='联系电话')),
            ],
        ),
    ]
