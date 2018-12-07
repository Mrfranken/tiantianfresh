from django.shortcuts import HttpResponseRedirect
import logging

def is_login(func):
    def loing_func(request, *args, **kwargs):
        user_id = request.session.get('user_id')
        if user_id:
            logging.debug('login has user id')
            print('login has user id: ', user_id)
            return func(request, *args, **kwargs)
        else:
            logging.debug('login has no user id')
            print('login has no user id')
            red = HttpResponseRedirect('/user/login/')
            red.set_cookie('url', request.get_full_path())
            return red
    return loing_func
