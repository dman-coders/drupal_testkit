# The Features

This folder contains the tests to be run.

## Test Tags

Some tags in the feature file correspond with the contexts defined in the behat.yml file.

### `@demo`

Tests labelled @demo are proviced by the starter testkit as samples.
If copying the demo tests to create your own, remove the `@demo` tag

### `@d7`

Indicates a Drupal 7 website test, as opposed to a 'website' behaviour test.
Informational only really.

### `@javascript`

Indicates that a javascript-enabled runner such as Selenium is required.

Tests should be structured in a way that allows content-only tests to be run without needing javascript and a full browser each time.

## Test folders

### `/selftest`

Tests in the selftest folder are mostly to make sure that the testing environment itself works at all.
Don't put project business logic tests in there.

### `/public`

Tests that probe the 'public' (anonymous user) interaction with the site.
