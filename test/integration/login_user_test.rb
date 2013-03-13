require 'minitest_helper'

feature 'Login User Test' do
  background do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
      { 'provider' => 'github', 'uid' => '12334',
        'info' => { 'nickname' => 'Test user', 'email' => 'test@user.com' }
      }
    )
  end

  scenario 'Not logged user' do
    visit '/'
 
    assert page.has_selector? '.sign-in'
  end

  scenario 'Login user' do
    visit '/'
 
    find('.sign-in').click
 
    assert !page.has_selector?('.sign-in')
    assert page.has_selector? '.sign-out'
  end

  scenario 'Reject blocked user' do
  end
end
