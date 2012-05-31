Feature: compute factorial
  in order to play with lettuce
  as beginners
  we'll implement factorial

  Scenario: factorial of 0
    Given I have the number 0
    When I compute its factorial
    Then I see the number 1

  Scenario: factorial of 1
    Given I have the number 1
    When I compute its factorial
    Then I see the number 1

  Scenario: factorial of 2
    Given I have the number 2
    When I compute its factorial
    Then I see the number 2

  Scenario: factorial of a bunch of numbers
    Given I have a bunch of numbers
      | number | factorial |
      |   3    |     6     |
      |   6    |    720    |
    I see the function output matching the table entry above.
