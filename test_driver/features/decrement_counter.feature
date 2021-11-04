Feature: Decrement Counter

    As the good shepherd
    I want to be able to decrement the count of my sheep when one is lost
    So that I can have extra joy incrementing the counter when I find the lost sheep

    Scenario: Counter decreases when the (-) button is pressed
        Given the counter is set to "10"
        When I tap the "decrement" button 1 time
        Then I expect the "counter" to be "9"