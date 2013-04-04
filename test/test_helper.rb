ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require "rails/test_help"
require "minitest/autorun"
require "minitest/rails"
require "minitest/focus"
require "minitest/colorize"
require "minitest/rails/capybara"

class ActiveSupport::TestCase
  include Warden::Test::Helpers

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  def self.prepare
    # Add anything that you need before suite starts
  end

  prepare

  def setup
    Warden.test_reset!
    setup_warden
  end

  def request
    @request ||= ActionController::TestRequest.new
  end

  def setup_warden
    @warden ||= begin
      manager = Warden::Manager.new(nil,
        &Rails.application.config.middleware.detect{|m| m.name == 'Warden::Manager'}.block)
        request.env['warden'] = Warden::Proxy.new(@request.env, manager)
     end
  end
  alias_method :warden, :setup_warden

  def log_in_user(id = 100)
    identity = Identity.find id
    warden.set_user identity, scope: :identity
  end
end

class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Capybara::RSpecMatchers
  include Capybara::DSL
  include Warden::Test::Helpers

end

class Capybara::Rails::TestCase
  def self.prepare
    # Add anything that you need before suite starts
  end

  prepare

  def setup
    Identity.destroy_all
    Event.destroy_all

    Warden.test_reset!
    Capybara.reset_sessions!
  end

  def mock_omniauth(uid = '12334')
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
      { 'provider' => 'github', 'uid' => uid,
        'info' => { 'nickname' => 'Test user', 'email' => 'test@user.com' }
      }
    )
  end
end
