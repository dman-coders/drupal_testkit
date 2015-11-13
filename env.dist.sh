#!/bin/bash

# TO MAKE THIS WORK, you should localize this setting to your
# actual URL.
#
# SEE SETUP.md for details.
# COPY this file to rename it 'env.sh'.
# EDIT it you include your actual test target.
# RUN it in your shell before running the Selenium test.

# Example localized setting
# export BEHAT_PARAMS='{"extensions":{
#   "Behat\\MinkExtension":{"base_url":"http://dev.niwa.dd:8083"},
#   "Drupal\\DrupalExtension":{"drush":{"alias":"@dev.niwa.dd"}}
# }}'

# Distributed starter example, suitable for selftest ONLY.
export BEHAT_PARAMS='{"extensions":{
  "Behat\\MinkExtension":{"base_url":"https://www.drupal.org/"},
  "Drupal\\DrupalExtension":{"drush":{"alias":"@drupal.org"}}
}}'

# It's handy to have this set also.
PATH=$PATH:vendor/bin