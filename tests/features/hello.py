# -*- coding: utf-8 -*-
from lettuce import step

@step('hello world returns what is expected')
def hello_world_returns_what_is_expected(step):
    import myapp.hello
    assert myapp.hello.hello_world() == 'Hello World'
