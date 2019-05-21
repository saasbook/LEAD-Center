Feature: Interests Upload
  As an Admin,
  I want to be able to upload a new Interests .csv file
  So that I can update the data used to match organizations

Scenario: upload file successfully
  Given I have logged in to the interests upload page
  When I upload a file
  Then I should see "File successfully uploaded."