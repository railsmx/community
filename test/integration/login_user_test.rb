require 'test_helper'

feature 'LoginUser Feature Test' do
  background do
    mock_omniauth
  end

  scenario 'Not logged user' do
    visit '/'

    assert page.has_selector? '.sign-in', text: 'Iniciar sesión'
  end

  scenario 'Login user' do
    visit '/'

    find('.sign-in').click

    assert !page.has_selector?('.sign-in')
    assert page.has_selector? '.sign-out', text: 'Cerrar sesión'
    assert page.has_selector? '.user-info', text: 'Bienvenido Test user'
  end

  scenario 'Reject blocked user' do
    Identity.create provider: 'github', uid: '224456', username: 'blocked',
      email: 'test@user.com', blocked: true
    mock_omniauth '224456'

    visit '/'

    find('.sign-in').click

    assert page.has_selector? '.alert', text: 'Su cuenta ha sido suspendida'
    assert page.has_selector? '.sign-in', text: 'Iniciar sesión'
  end
end
