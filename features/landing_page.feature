Feature: Landing Page Template
  As a User,
  I want to visit communities.berkeley.edu and see a landing Page
  So that I can have access to the sign in button

Scenario: see sign in button when not signed in
  Given I am on "landing page"
  Then I should see a sign in button

Scenario: redirected to landing page when not signed in
  Given I am on "home page"
  Then I should be redirected to "landing page"

Scenario: redirected to home page when clicking sign in button
  Given I am on "landing page" 
  And click sign in button
  Then I should be redirected to "home page"

Scenario: redirected to home page when previously signed in
  Given I am logged in
  And I am on "landing page"
  Then I should be redirected to "home page"
