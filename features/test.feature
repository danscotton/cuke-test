Feature: Test

    Scenario: One
        Given I am on a page
        When I click a mix
        And I click skip
        Then the player displays "Track Two"
