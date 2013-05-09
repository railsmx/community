source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'

gem 'pg'
gem 'puma'
gem 'dalli'
gem 'warden', '~> 1.2.1'
gem 'omniauth-github'
gem 'pretty_formatter'
gem 'friendly_id', github: 'FriendlyId/friendly_id', branch: 'rails4'
gem 'mail_form', github: 'mariochavez/mail_form'
gem 'crowdblog', github:  'crowdint/crowdblog', branch: 'rails4-userless'

gem 'gravatar_image_tag'
gem 'twitter', github: 'sferik/twitter'

group :production do
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
  gem 'fog'
  gem 'newrelic_rpm'
end

gem 'exception_notification', '~> 4.0.0.rc1'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.0'
  gem 'coffee-rails', '~> 4.0.0'

  gem 'uglifier', '>= 1.0.3'

  gem 'bourbon'
  gem 'bootstrap-datepicker-rails',
    :require => 'bootstrap-datepicker-rails',
    github: 'Nerian/bootstrap-datepicker-rails'
  gem 'font-awesome-rails'
end

gem 'jquery-rails'

gem 'geocoder'

group :test do
  gem 'minitest-rails'
  gem 'minitest-focus'
  gem 'minitest-colorize'
  gem 'minitest-capybara', '= 0.1.0'
  gem 'minitest-rails-capybara'
  gem 'launchy'
end

group :development do
  gem 'pry-rails'
  gem 'foreman'
  gem 'cane'
  gem 'brakeman'
  gem 'better_errors'
  gem 'meta_request'
end


# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 1.0.1'
