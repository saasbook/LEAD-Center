Feature: Interests Quiz
  As a logged in user
  I want to be able to take an interests quiz
  so that I be matched with orgs at Cal

  Background:
    Given the following questions exist:
    | title | options | next_question | can_skip |
    | First question. | { 'yes' => ['Sports', 'Wellness', 'Outdoors'], 'no' => ['Food', 'Indoors'] } | { 'yes' => 2, 'no' => 2 } | false |
    | Last question | { 'yes' => ['Greek'], 'no' => ['Some Category', 'Indoors'] } | { 'yes' => nil, 'no' => nil } | false |
    Then 2 seed questions should exist

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
    And I click the "Start" button
    When I repeatedly answer questions
    Then I should see a finished quiz page

  Scenario: User should not see Quiz modal when Start button not clicked
    Given I am not logged in
    And I am on "home page"
    When I do not click the "Start" button
    Then I should not see the quiz modal

  Scenario: Should not see Start Quiz button when not logged in
    Given I am not logged in
    And I am on "home page"
    Then I should not see a "Start" button
  