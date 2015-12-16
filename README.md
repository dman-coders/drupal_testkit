# Project Tests

Behat Testing Suite for this project.

For first time setup, there are a number of steps to get started,
see [SETUP.md](SETUP.md)

If all your setup is complete and tested, then to run all tests, go

    . env.sh
    behat


However, that will do everything.
Uusally best to start with the selftest ones, then work up from there.

## To generate some component screenshots

    behat --profile chrome features styleguide

## Troubleshooting

If running behat stalls when trying to run a @javascript test, you need to
start the selenium browser runner that should be on in the background.
See [SETUP.md](SETUP.md)
(If the process stalls, it never comes back,
 you may need to kill it from above)
