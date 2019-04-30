Feature: Organizations Page
  As a User,
  I want to see my quiz results on the organizations results page
  So that I can find the organizations that fit me

Scenario: see organizations on quiz results
  Given I have taken a quiz
  And I am on my quiz results page
  Then I should see my matched organizations
