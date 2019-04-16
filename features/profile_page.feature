Feature: profile page and edit page

  As an app user
  So that I can review my info and edit them
  I want to see my info on the profile page and be able to edit

Background: users have been added to database

    Given the following users exist:
    | first_name | last_name | major | gender | grad_year | ethnicity  | transfer | graduate | international |
    | Tony       | Li        | IEOR  | Male   | 2020      | East Asian | false    | false    | false         |

    And I am on the profile page
    Then I should see "Profile"
    Then I should see "First Name"

Scenario: editing first name
    When I press "Edit Profile"
    And I fill in "first_name" with "Dean"
    And I press "Submit"
    Then I should see "Dean" after "First Name"
    And I should see "Dean" before "Last Name"
    And I should not see "Tony"

Scenario: editing grad_year
    When I press "Edit Profile"
    And I select "2021" from "grad_year"
    And I press "Submit"
    Then I should see "2021" after "Graduation Year"
    And I should not see "2020"

Scenario: editing international
    When I press "Edit Profile"
    And I check "international"
    And I press "Submit"
    Then I should see "Yes" after "International"
