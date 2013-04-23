# README

This README would normally document whatever steps are necessary to get the
application up and running.


## Build
**Branch: Working**
[![Build Status](https://travis-ci.org/mariochavez/community.png?branch=working)](https://travis-ci.org/mariochavez/community)

**Branch: Coderetreat**
[![Build Status](https://travis-ci.org/mariochavez/community.png?branch=coderetreat)](https://travis-ci.org/mariochavez/community)

**Branch: Master**
[![Build Status](https://travis-ci.org/mariochavez/community.png?branch=master)](https://travis-ci.org/mariochavez/community)

## Dependencies
This application depends on Ruby 2.0 and Ruby on Rails 4.0

## Authentication
For authentication it uses OmniAuth with a Github provider

Before starting the application export Github OAuth keys as follow:

    export GITHUB_KEY=4849ab3245ef432
    export GUTHYB_SECRET=83478374872acb7848393

These keys are being used in the omniauth.rb initializer

## Run tests
For tests minitest in being used so all tests can been found in /test
directory. For integration tests minitest with capybara is being used.

To run test, use rake tasks:

    rake test
    rake test:models
    rake test:controllers
    rake test:integration

## Configuration
Puma is the web server used for this application, so we shouls avoid running

    rails server

And instead start puma server with foreman as follow:

    foreman start

This command will start puma server on localhost at port 5000,
http://127.0.0.1:5000

## Database
Posqtgresql database is being used in this application.
To start with a clean database run:

    rake db:drop db:setup
