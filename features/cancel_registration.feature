Feature: Cancel Account

  Background:
    Given I am signed in
    And I go to user profile page

  Scenario: Cancel account from profile page
    When I click link "Cancel my account"
    Then I should see goodbye message
    And I shouldn't be able to log in again
