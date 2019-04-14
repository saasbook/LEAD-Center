Feature: Interests Quiz
  As a logged in user
  I want to be able to take an interests quiz
  so that I be matched with orgs at Cal

  Scenario: See Start Quiz button when logged in
    Given I am logged in
    And I am on "home page"
    Then I should see a "Start" button

  Scenario: Open Quiz modal when Start button clicked
    Given I am logged in
    And I am on "home page"
    When I click the "Start" button
    Then I should see the quiz modal

  Scenario: Finish the quiz
    Given I am logged in
    And I am on "home page"
    And I see the quiz modal
    When I repeatedly answer questions
    Then I should see a finished quiz page

  Scenario: Should not see Start Quiz button when not logged in
    Given I am not logged in
    And I am on "home page"
    Then I should not see a "Start" button
  