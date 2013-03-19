require 'minitest_helper'

feature 'Events management' do
  background do
    mock_omniauth
  end

  scenario 'As logged user I should be able to create an event' do
    login_user
    click_link 'Eventos'

    click_link 'Agregar evento'

    within('#new_event') do
      fill_in 'event_name', with: 'MagmaConf'
      fill_in 'event_location', with: 'Manzanillo, Colima'
      fill_in 'event_date', with: '06/06/2015'
      fill_in 'event_time', with: '18:00'
      fill_in 'event_organizer', with: 'Crowd Interactive'
      fill_in 'event_contact', with: 'http://magmaconf.com'
      fill_in 'event_description', with: 'Conferencias'
    end

    click_button 'Crear evento'

    assert page.has_selector?('.notice', text: 'Su evento ha sido creado')
  end

  scenario 'An event should not be created if it has invalid info' do
    login_user
    click_link 'Eventos'

    click_link 'Agregar evento'

    click_button 'Crear evento'

    assert page.has_selector?('.alert', text: 'Por favor revise la información del evento')
  end

  scenario 'As not logged user I should not be able to create an event' do
    visit '/'
    click_link 'Eventos'

    assert !page.has_selector?('a', text: 'Agregar evento')
  end

  scenario 'As event owner I should be able to edit the event' do
    event = add_event
    login_user
    click_link 'Eventos'

    within("#event_#{event.id}") do
      click_link 'Modificar'
    end

    click_button 'Actualizar evento'
    assert page.has_selector?('.notice', text: 'Su evento ha sido actualizado')
  end

  scenario 'I should not be able to edit an event from other user' do
    skip('WIP')
    event = add_event('998877')
    login_user
    click_link 'Eventos'

    within("#event_#{event.id}") do
      click_link 'Modificar'
    end
  end

end

def login_user
  visit '/'

  find('.sign-in').click
end

def add_event(identity_id = '12334')
  Event.create name: 'MagmaConf', description: 'Conferencias',
    date: DateTime.now + 100, location: 'Manzanillo Colima',
    contact: 'http://magmaconf.com', organizer: 'Crowdint',
    identity_id: identity_id
end
