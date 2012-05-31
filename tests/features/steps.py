# -*- coding: utf-8 -*-
from lettuce import step, world

@step('Given I have the number (\d+)')
def given_i_have_the_number_0(step, number):
    world.number = int(number)

@step('When I compute its factorial')
def when_i_compute_its_factorial(step):
    world.number = factorial(world.number)

@step('Then I see the number (\d+)')
def then_i_see_the_number_1(step, expected):
    expected = int(expected)
    assert expected == world.number, \
        "Got %d" % world.number

@step('Given I have a bunch of numbers')
def given_i_have_a_bunch_of_numbers(step):
    world.numbers = []
    for n in step.hashes:
        m = {}
        m['number'] = int(n['number'])
        m['factorial'] = int(n['factorial'])
        world.numbers.append(m)

@step('I see the function output matching the table entry above.')
def i_see_the_function_output_matching_the_table_entry_above(step):
    for n in world.numbers:
        assert factorial(n['number']) == int(n['factorial'])


def factorial(number):
    number == int(number)
    if (number == 0) or (number == 1):
        return 1
    else:
        return number*factorial(number-1)
