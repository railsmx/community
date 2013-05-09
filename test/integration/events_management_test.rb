require 'test_helper'

feature 'EventsManagement Feature Test' do
  background do
    mock_omniauth
  end

  scenario 'As logged user I should be able to create an event' do
    login_user

    visit '/eventos'

    stub_method_instance(Twitter, :update) {
      |args| args[0].must_include "MagmaConf 2013 http://www.example.com/eventos/magmaconf-2013"
    }

    click_link 'Registrar evento'

    within('#new_event') do
      fill_in 'event_name', with: 'MagmaConf 2013'
      fill_in 'event_address', with: 'Carretera Manzanillo-Cihuatlán kilómetro 20, Manzanillo, Colima'
      fill_in 'event_location', with: 'Manzanillo, Colima'
      fill_in 'event_date', with: '06/06/2015'
      fill_in 'event_time', with: '18:00'
      fill_in 'event_organizer', with: 'Crowd Interactive'
      fill_in 'event_contact', with: 'http://magmaconf.com'
      fill_in 'event_description', with: 'Conferencias'
    end

    click_button 'Crear evento'

    page.must_have_selector('.notice', text: 'Su evento ha sido creado')
  end

  scenario 'An event should not be created if it has invalid info' do
    login_user

    visit '/eventos'

    click_link 'Registrar evento'

    click_button 'Crear evento'

    page.must_have_selector('.alert', text: 'Por favor revise la información del evento')
  end

  scenario 'As not logged user I should not be able to create an event' do
    visit '/'
    click_link 'Eventos'

    page.wont_have_selector('a', text: 'Registrar evento')
  end

  scenario 'As event owner I should be able to edit the event' do
    login_user

    identity = Identity.last
    event = add_event(identity.id)

    click_link 'Eventos'

    within("#event_#{event.id}") do
      click_link 'editar'
    end

    click_button 'Actualizar evento'

    page.must_have_selector('.notice', text: 'Su evento ha sido actualizado')
  end

  scenario 'I should not be able to edit an event from other user' do
    login_user
    logged_user = Identity.last

    identity = Identity.create uid: '998877', provider: 'github', username: 'second', email: 'second@user.com'

    event1 = add_event(logged_user.id)
    event2 = add_event(identity.id)

    click_link 'Eventos'

    page.must_have_selector("#event_#{event1.id} a.edit")
    page.wont_have_selector("#event_#{event2.id} a.edit")
  end

  scenario 'I should not be able to edit a past event' do
    login_user
    logged_user = Identity.last

    event1 = add_event(logged_user.id)
    event1.date = DateTime.now - 1
    event1.save(validate: false)

    click_link 'Eventos'

    page.wont_have_selector("#event_#{event1.id} a.edit")
  end

end

def login_user
  visit '/'

  find('.sign-in').click
end

def add_event(identity_id = '12334')
  events_count = Event.count + 1
  Event.create name: "MagmaConf #{events_count}",
    description: 'Conferencias',
    date: DateTime.now + 100, location: 'Manzanillo Colima',
    address: 'Carretera Manzanillo-Cihuatlán kilómetro 20, Manzanillo, Colima',
    contact: 'http://magmaconf.com', organizer: 'Crowdint',
    identity_id: identity_id
end
