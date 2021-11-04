Feature: Increment Counter

    As the good shepherd
    I want to be able to count my sheep
    So that I notice if one is missing
Scenario: Counter increases when the button is pressed
    Given the counter is set to "0"
    When I tap the "increment" button 10 times
    Then I expect the "counter" to be "10"
Scenario Outline: Counter decreases when the (-) button is pressed
    Given the counter is set to "<initial-counter>"
    When I tap the "decrement" button <decrement> time
    Then I expect the "counter" to be "<final-counter>"
    Examples:
        | initial-counter | decrement | final-counter |
        | 10              | 1         | 9             |
        | 10              | 9         | 1             |
        | 3               | 3         | 0             |
Scenario: Counter should not be negative
    Given the counter is set to "0"
    When I tap the "decrement" button 1 time
    Then I expect the "counter" to be "0"