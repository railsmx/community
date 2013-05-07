require 'test_helper'

feature 'BlogManagement Feature Test' do
  background do
    mock_omniauth
  end

  scenario "when current user is publisher" do

    visit "/blog/admin"

    save_and_open_page
    page.must_have_selector('a.brand', text: 'Crowdblog')
  end

  scenario "when current user isn't publisher" do

    visit "/blog/admin"

    page.must_have_selector('div.info', text: 'Blog')
  end
end

