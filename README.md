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


## Custom asset pipeline
For use community view in the application need custom asset pipeline

Before starting the application export THEME key as follow:

    export THEME = name_asset_pipeline

You need create your files associated with THEME

For example: 

THEME = rubycommunity

    assets/javascripts/rubycommunity.js
    assets/stylesheets/rubycommunity.css

    views/rubycommunity <- all views

## Authentication
For authentication it uses OmniAuth with a Github provider

Before starting the application export Github OAuth keys as follow:

    export GITHUB_KEY = client_id
    export GUTHUB_SECRET = cliente_secret

These keys are being used in the omniauth.rb initializer

## Twitter
For use twitter it uses gem Twitter with OAuth Access and Tokens 

Before starting the application export Twitter OAuth keys as follow:

    export TWITTER_CONSUMER_KEY = consumer_key
    export TWITTER_CONSUMER_SECRET = consumer_secret
    export TWITTER_OAUTH_TOKEN = access_token
    export TWITTER_OAUTH_TOKEN_SECRET = access_token_secret

These keys are being used in the twitter.rb initializer

## Facebook
For use "I Like" it uses Socialite needs a AppId

Before starting the application export Facebook AppId key as follow:

    export FACEBOOK_APPID = facebook_application_id

These key is being used in the community.rb initializer

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
