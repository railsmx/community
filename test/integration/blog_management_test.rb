require 'test_helper'

feature 'BlogManagement Feature Test' do
  background do
    mock_omniauth('12334', 'test@user.com')
    Rails.application.config.publishers = 'test@user.com'
  end

  scenario "when current user is publisher" do
    login_user

    visit "/blog/admin"

    page.must_have_selector('div.span12', text: 'Posts')
  end

  scenario "when current user isn't publisher" do
    mock_omniauth('12263', 'test2@user.com')

    login_user

    visit "/blog/admin"

    page.must_have_selector('div.info', text: 'Blog')
  end
end

def login_user
  visit '/'

  find('.sign-in').click
end
