def test_pass():
    pass

def test_hello():
    import myapp.hello
    assert myapp.hello.hello_world() == 'Hello World'
