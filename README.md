# README

This README would normally document whatever steps are necessary to get the
application up and running.


## Build
**Branch: Working**
[![Build Status](https://travis-ci.org/railsmx/community.png?branch=working)](https://travis-ci.org/railsmx/community)

**Branch: Master**
[![Build Status](https://travis-ci.org/railsmx/community.png?branch=master)](https://travis-ci.org/railsmx/community)

## Dependencies
This application depends on Ruby 2.0 and Ruby on Rails 4.0


## Custom asset pipeline
For use community view the application needs a custom asset pipeline

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

## SMTP
For SMTP it uses ActionMailer with SendGrid Account

Before starting the application export SendGrid account keys as follow:

    export APP_DOMAIN = app_name_domain
    export SENDGRID_USERNAME = sendgrid_username
    export SENDGRID_PASSWORD = sendgrid_password

These keys are being used in the smtp_setup.rb initializer

## Publishers
For publisher it uses Crowdblog

Before starting the application export publishers key as follow:

    export PUBLISHERS = "for_each_publisher_with_comma"
    
These key is being used in the crowdblog.rb initializer

## Disqus

For disqus it uses Crowdblog

Before starting the application export disqus shortname key as follow:

    export DISQUS_KEY = shortname

These key is being used in the crowdblog.rb initializer

## Memcachier

For cache it uses MemCachier which will work with Dalli

Before starting the application you’ll need to pass the proper credentials to Dalli as follow:

    export ENV["MEMCACHIER_SERVERS"] = memcachier_servers
    export ENV["MEMCACHIER_USERNAME"] = memcachier_username
    export ENV["MEMCACHIER_PASSWORD"] = memcachier_password

These keys are being used in the production.rb environment

## Twitter
To implement Twitter functionalities it uses the gem Twitter with OAuth Access and Tokens

Before starting the application export Twitter OAuth keys as follow:

    export TWITTER_CONSUMER_KEY = consumer_key
    export TWITTER_CONSUMER_SECRET = consumer_secret
    export TWITTER_OAUTH_TOKEN = access_token
    export TWITTER_OAUTH_TOKEN_SECRET = access_token_secret

These keys are being used in the twitter.rb initializer

## Facebook
To implement the "I Like" fucntion of Facebook it uses Socialite which needs a Facebook AppId

Before starting the application export Facebook AppId key as follow:

    export FACEBOOK_APPID = facebook_application_id

This key is being used in the community.rb initializer

## CrowdBlog
To restrict access to the CrowdBlog admin section it uses the publishers enviroment variable

Export the PUBLISHERS variable with the list of admin emails separated with a comma as follow:

    export PUBLISHERS = 'an_email, another_email'

This variable is required in the crowdblog.rb initializer

## Run tests
Minitest is used to test this app so all tests can been found in the /test
directory. For integration tests minitest with capybara is being used.

To run the tests use the following rake tasks:

    rake test
    rake test:models
    rake test:controllers
    rake test:integration

## Configuration
Puma is the web server used for this application, so we should avoid running

    rails server

Instead you must start puma server with foreman as follow:

    foreman start

This command will start puma server on localhost at port 5000,
http://127.0.0.1:5000

## Database
Posqtgresql database is being used in this application.
To start with a clean database run:

    rake db:drop db:setup
