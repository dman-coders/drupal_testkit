<?php

// This provides some basic steps.
use Drupal\DrupalExtension\Context\RawDrupalContext;
// This provides the prompts to add missing steps.
use Behat\Behat\Context\SnippetAcceptingContext;
// These are boilerplate. Unused yet?
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawDrupalContext implements SnippetAcceptingContext {

  /**
   * Initializes context.
   *
   * Every scenario gets its own context instance.
   * You can also pass arbitrary arguments to the
   * context constructor through behat.yml.
   */
  public function __construct() {
  }


}
