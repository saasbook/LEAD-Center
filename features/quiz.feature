Feature: Interests Quiz
  As a logged in user
  I want to be able to take an interests quiz
  so that I be matched with orgs at Cal

  Background:
    Given the following questions exist:
    | title | options | next_question | question_type |
    | First question. | { 'Academic' => ['Academic', 'Campus Departments', 'Departmental Organizations'], 'Advocacy' => ['Academic', 'Cultural & Ethnic', 'Environmental & Sustainability'] } | { 'Academic' => 2, 'Advocacy' => 3} | 'categories' |
    | Second question based on Academic. | { 'Academic Advocacy' => ['Academic','Advocacy','Environmental', 'Social Activism'], 'Academic Enrichment' => ['Academic', 'Academic - Honor Society', 'Educational'] } | { 'Academic Advocacy' => nil, 'Academic Enrichment' => nil} | 'interests' |
    | Third question based on Advocacy. | { 'Cultural/Ethnic' => ['Advocacy', 'Cultural', 'Ethnic', 'Multicultural', 'Native American'], 'Educational' => ['Advocacy', 'Educational'] } | { 'Cultural/Ethnic' => nil, 'Educational' => nil} | 'interests' |
    Then 3 seed questions should exist

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

  @hello
  Scenario: See org info
    Given I am logged in
    And I am on "home page"
    And I click the "Start" button
    When I repeatedly answer questions
    And I click the See Orgs button
    Then I should see matched orgs