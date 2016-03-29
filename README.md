# Project Tests

Behat Testing Suite for this project.

For first time setup, there are a number of steps to get started,
see [SETUP.md](SETUP.md)

If all your setup is complete and tested, then to run all tests, go

    . env.sh
    behat

However, that will do everything, and not everything will work.
Usually best to start with the selftest ones, then work up from there.

Alternative environments (env-preview.sh, env-live.sh) may also be chosen.

## To run some self-tests

    behat features/selftest/selftest.feature

## To generate some component screenshots

Requires Chromerunner to be listening!

    behat --profile=chrome --suite=styleguide

Will use chrome to run the tests identified by the named suite (set of tests)

## Troubleshooting

If running behat stalls when trying to run a @javascript test, you need to
start the selenium browser runner that should be on in the background.
See [SETUP.md](SETUP.md)
(If the process stalls, it never comes back,
 you may need to kill it from above)
