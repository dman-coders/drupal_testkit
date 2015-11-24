# To get this working:

    composer install
    bin/behat --init

This will install the main dependencies locally. 
A fresh install may take a minute or two and download 17M.

It can be more efficient for you to install the entire Behat dependency
package once, [somewhere more global](http://behat-drupal-extension.readthedocs.org/en/3.0/globalinstall.html)
on your machine.
However, as versions of these libraries can be sensitive,
and we don't want to cause any side effects - these instructions will try to 
keep as much as possible local to this install directory.
If this is a tool you want to use in more than one place, then consider
shifting the libraries to a higer place.

By default, tests will run 'headless' with the goutte html-only 
requests. You won't see anything but the analysis results.

### Suggested - set up PATH
 
To find your local vender/bin path so you can just type 'behat'.

    PATH=$PATH:vendor/bin

### Required - Set up an environment var to define your sites URL

    export BEHAT_PARAMS='{"extensions":{
      "Behat\\MinkExtension":{"base_url":"http://dev.drupal.dd:8083"},
      "Drupal\\DrupalExtension":{"drush":{"alias":"@dev.drupal.dd"}}
    }}';

Now, in the shell you are using, and will be running behat from,
initialize those parameters by going

    . env.sh

You'll need to do that at the beginning of each session.

These two steps are required for each shell session. 
Alternatively you can edit the behat.yml file directly.

# Run behat

    behat features/selftest/selftest.feature 

You should see the results of the requests behat made to your target webserver.

## Run Behat in Chrome, Firefox, or Phantomjs

Each of these need extra installation steps, but when running, you can trigger 
browser tests.

    behat -p chrome features/selftest/screenshot.feature 
    behat -p phantomjs features/selftest/screenshot.feature 

# Install Selenium server, Phantomjs, or both.

Installing browser runners is technically optional for basic
web test cases, but if you want a visual on the results,
or to test javascript, then these engines must be made available.

These task runners can also be remote or networked, not covered here.

The technology changes fast, so search the docs for the most recent versions etc!
This setup from 2015-06 uses:

* behat version 3.0.15
* selenium server 2.41.0
* chromedriver ChromeDriver 2.16.333243
* phantomjs 2.0.0

## Install Selenium server locally (OSX)

Local on OSX, try instructions from
https://gist.github.com/dhrrgn/c2db3dbcc0ccc7dba500
to place the jar file into /usr/lib/selenium/

That also gives steps for setting up the service so it autostarts
which is much more fun than doing it manually.
See `org.nhabit.Selenium.plist`

However, the first time, you should do it by hand until it's running
so you can confirm it's working.

It is expected to immediately run Firefox without much
extra effort, and can also run Chrome by installing chromedriver.

### Start the Selenium server manually

    java -jar /usr/lib/selenium/selenium-server-standalone-2.41.0.jar -port 4444

This will continue running in the current shell by default, 
so do it in another window or background it.

### Check Selenium is successfully running

You can visit its monitoring condole on port 4444
http://localhost:4444/wd/hub/static/resource/hub.html

### Install Chromedriver to run chrome.

[Check the latest docs, as development is ongoing here](https://sites.google.com/a/chromium.org/chromedriver/getting-started)

Place it in (eg /usr/lib/chromedriver) or (better) your /usr/local/bin/

If you place chromedriver somewhere NOT in your $path, then list the path
for the server to find it.

    java -jar /usr/lib/selenium/selenium-server-standalone-2.41.0.jar \
      -port 4444 -Dwebdriver.chrome.driver=/usr/local/bin/chromedriver

### Test Selenium + chromedriver is running

When all is running, run feature tests with chrome by specifying it in the
behat command by naming the `chrome` profile.

    behat -p chrome features/selftest/selftest.feature 
    behat -p chrome features/selftest/screenshot.feature

## Install PhantomJS to run a headless test

PhantomJS is a virtual headless browser emulator, that nevertheless runs 
DOM and javascript.
It works much like Selenium, so requires a daemon task to be running
which Behat sends instructions to.
Avoid older tutorials that say to install it with `sahi`. The more recent 
version works stand-alone.

    brew update && brew install phantomjs

Like Selenium server this can be started manually, then left running.

### Start PhantomJS service manually on its own port

    phantomjs --webdriver=8643

### Test PhantomJS is running 

    behat -p phantomjs features/selftest/selftest.feature
    behat -p phantomjs features/selftest/screenshot.feature
    
## Troubleshooting

If running a test freezes, and CTRL-C does NOT escape it (dunno why, some misconfigurations while waiting for the virtual browser I think) then the stuck process can be stopped with :

    CTRL-Z
    ps
    kill {the running process id}
    
This is pretty normal, but behat runner is the first time I've seen a php-cli ignore the CTRL-C interrupt.

The cause is still just something when I introduce bad code in development, it is not expected to be a symptom when using a stable set of tests.
