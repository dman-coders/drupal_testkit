@d7
@demo
Feature: Check behaviour of RSS feeds
  In order to aggregate published content
  As a robot
  I need to retrive RSS XML

  Scenario: Open the Feeds page
    Given I am on "rss.xml"
    Then the response should contain "<channel>"
    And the response should contain "<item>"

