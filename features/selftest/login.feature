@d7
@demo
@api
Feature: DrupalContext
  In order to ensure the testing connections are working
  As a tester
  I need to prove that behat testing works.

  Scenario: Create and log in as a user
    Given I am logged in as a user with the "authenticated user" role
    When I click "My account"
    Then I should see the heading "History"

  Scenario: Test that blackbox login works
    Given I am logged in as "dummy" with password "dummy"
    When I click "My account"
    Then I should see the heading "History"
    
  @api
  Scenario: Log in as superadmin
    Given I am logged in as the superuser
    And I visit "/admin/modules"
    Then the response status code should be 200
