require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Assets should be precompiled for production (so we don't need the gems loaded then)
Bundler.require(*Rails.groups(assets: %w(development test)))

module Community
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    config.autoload_paths += Dir["#{config.root}/lib"]

    config.log_formatter = PrettyFormatter.formatter

    Rails.application.config.assets.precompile += ["crowdblog.css", "crowdblog.js"]
    require "#{Rails.root}/config/initializers/community.rb"
  end
end
