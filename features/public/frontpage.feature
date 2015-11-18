@d7
@demo
Feature: Check connection to the site
  In order to ensure that anonymous users can see the site
  As a member of the public
  I need to see content on the website

  Scenario: Test opening the front page
    Given I am on the homepage
    Then the response should contain "Latest News"
    And the response should contain "<h1"
