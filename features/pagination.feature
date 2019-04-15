Feature: Pagination on Organizations
  As a UC Berkeley student,
  I want to be able to view 3 organizations at a time once I take the quiz,
  So that I am not overwhelmed by all the organizations at once.

Scenario: 
  Given I am logged in
  And I am on "home page"
  Then I should see the organizations I am matched with appear 3 at a time
