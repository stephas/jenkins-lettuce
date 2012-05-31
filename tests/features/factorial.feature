Feature: compute factorial
  Scenario Outline: Factorial [0-4]
    Given I have the number <x>
    When I compute its factorial
    Then I see the number <y>

  Examples:
    |x|y|
    |6|720|
