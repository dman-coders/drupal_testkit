@demo
Feature: Check connection to the drupal.org site
  In order to ensure the testing connections are working
  As a tester
  I need to prove that behat testing works.

  Scenario: Test opening the front page and checking the H1 for Drupal
    Given I am on the homepage
    Then the response should contain "<h1 id=\"site-name\"><a href=\"/\" title=\"Drupal\">Drupal</a></h1>"
