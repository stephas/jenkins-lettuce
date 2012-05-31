""" This is the hello world demo module """


def hello_world():
    ''' function to return hello world string '''
    return 'Hello World'

print(hello_world())


def factorial(number):
    """ return factorial of given number """
    number = int(number)
    if (number == 0) or (number == 1):
        return 1
    else:
        return number * factorial(number - 1)
