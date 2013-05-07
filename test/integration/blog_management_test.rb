require 'test_helper'

feature 'BlogManagement Feature Test' do
  background do
    mock_omniauth_blog(12334, 'test@user.com')
  end

  scenario "when current user is publisher" do
    login_user

    visit "/blog/admin"

    page.must_have_selector('div.span12', text: 'Posts')
  end

  scenario "when current user isn't publisher" do
    mock_omniauth_blog(12263, 'test2@user.com')

    login_user

    visit "/blog/admin"

    page.must_have_selector('div.info', text: 'Blog')
  end
end

def login_user
  visit '/'

  find('.sign-in').click
end

def mock_omniauth_blog(uid = '12334', email)
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
    { 'provider' => 'github', 'uid' => uid,
      'info' => { 'nickname' => 'Test user', 'email' => email }
    }
  )
end