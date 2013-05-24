# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
secret_token = if Rails.env.production?
                 ENV['SECRET_TOKEN']
               else
                 '1da52ceef866b5ebb5997f0d1495a3c97826dcb605e3c8a00f0e6de40f06208d84bac74c62f0f08803bbfd7382e52d57c0903959468ffc917387cb638ec1e535'
               end
Community::Application.config.secret_key_base = secret_token
