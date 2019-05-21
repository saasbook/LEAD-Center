Feature: profile page and edit page
  As an app user
  So that I can review my info and edit them
  I want to see my info on the profile page and be able to edit

  Background: users have been added to database

    Given the following users exist:
      | first_name | last_name | major | gender | grad_year | ethnicity  | transfer | graduate | international |
      | Tony       | Li        | IEOR  | Male   | 2020      | East Asian | false    | false    | false         |
    And I am logged in
    And I am on the profile page

  Scenario: editing first name
    When I press "Edit Profile" link
    And I fill in "first_name" with "Dean"
    And I press "Save Profile"
    Then I should see "Dean"
    And I should not see "Tony"

  Scenario: editing grad_year
    When I press "Edit Profile" link
    And I select "2021" from "grad_year"
    And I press "Save Profile"
    Then I should see "2021" after "Graduation Year"
    And I should not see "2020"

  Scenario: editing international
    When I press "Edit Profile" link
    And I check "international"
    And I press "Save Profile"
    Then I should see "International"

  Scenario: checking graduate checkbox
    When I press "Edit Profile" link
    And I check "graduate"
    And I press "Save Profile"
    Then I should see "Graduate"

  Scenario: unchecking graduate checkbox
    When I press "Edit Profile" link
    And I check "graduate"
    And I press "Save Profile"
    Then I should see "Graduate"
    When I press "Edit Profile" link
    And I check "graduate"
    And I press "Save Profile"
    Then I should not see "Graduate"

  Scenario: choose multiple ethnicities
    Given I am on the profile page
    And I see "East Asian"
    When I press "Edit Profile" link
    And I check "Latinx"
    And I press "Save Profile"
    Then I should see "Latinx"
    And I should see "East Asian"

  Scenario: change from multiple to single ethnicity
    Given I am on the profile page
    And I see "East Asian"
    When I press "Edit Profile" link
    And I check "Latinx"
    And I press "Save Profile"
    Then I should see "Latinx"
    And I should see "East Asian"
    When I press "Edit Profile" link
    And I check "Latinx"
    And I press "Save Profile"
    Then I should not see "Latinx"
    And I should see "East Asian"

  Scenario: editing Gender
    When I press "Edit Profile" link
    And I fill in "gender" with "Non Binary"
    And I press "Save Profile"
    Then I should see "Non Binary"
    And I should not see "Male"

  Scenario: automatically titleize Gender text
    When I press "Edit Profile" link
    And I fill in "gender" with "queer"
    And I press "Save Profile"
    Then I should see "Queer"
    And I should not see "queer"