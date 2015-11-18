@demo
Feature: Check connection to the site
  In order to ensure the testing connections are working
  As a tester
  I need to prove that behat testing works.

  Scenario: Test opening the front page and checking the 'Generator' metatag
    Given I am on the homepage
    Then the response should contain '<meta name="Generator" content="Drupal 7 (http://drupal.org)" />

