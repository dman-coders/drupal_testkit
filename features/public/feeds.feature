@demo
Feature: Check behaviour of RSS feeds
  In order to aggregate publiched content
  As a robot
  I need to retrive RSS XML

  Scenario: Open the Feeds page
    Given I am on "feeds"
    Then the response should contain "News Feeds"
    And the response should contain "All Releases"

  Scenario: Retrieve All Releases Feed (Raw)
    # Note, the links on the releases page go via feedburner.
    # We will check our local RSS provided by views instead.
    Given I am on "releases/feed"
    Then the response should contain "Latest releases from beehive.govt.nz"

  Scenario: Feeds should not expose the editor identity
    Given I am on "releases/feed"
    Then the response should not contain "<dc:creator>Matthew.Floratos</dc:creator>"
    And the response should not contain "<dc:creator>Rachel.Morton</dc:creator>"

