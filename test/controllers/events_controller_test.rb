require "test_helper"

describe EventsController do
  let(:params) {
    { name: 'MagmaConf',
      address: 'Carretera Manzanillo-Cihuatlán kilómetro 20,Manzanillo, Colima',
      location: 'Manzanillo',
      description: 'Cool conf',
      contact: 'mg@crowdint.com',
      organizer: 'Crowdint',
      date: '28/2/2015',
      time: '5:05 pm' }
  }

  let(:event) { Event.create name: 'MagmaConf',
                address: 'Carretera Manzanillo-Cihuatlán kilómetro 20,Manzanillo, Colima',
                location: 'Manzanillo', description: 'Cool conf',
                contact: 'mg@crowdint.com', organizer: 'Crowdint',
                date: Date.today + 10, identity_id: 100
  }


  describe 'new' do
    it "should display new form for logged user" do
      log_in_user

      get :new

      assert_response :success
      assert_template :new
    end

    it "should redirect to events when not logged user" do
      get :new

      assert_redirected_to root_path
      flash[:notice].wont_be_nil
    end
  end

  describe "create" do
    it "should create new event for logged user and post a tweet" do
      log_in_user

      stub_method_instance(Twitter, :update) {
        |args| args[0].must_include "MagmaConf http://test.host/eventos/"
      }

      post :create, event: params

      assert_redirected_to events_path
      flash[:notice].wont_be_nil
    end

    it "should not create new event when not logged user" do
      post :create, event: params

      assert_redirected_to root_path
      flash[:notice].wont_be_nil
    end

    it "should not create new event when params are invalid" do
      log_in_user

      invalid_params = params.merge({ name: '' })
      post :create, event: invalid_params

      assert_response :success
      assert_template :new
      flash.now[:alert].wont_be_nil
    end
  end

  describe "edit" do
    it "should be able to edit my events" do
      log_in_user

      get :edit, id: event.id

      assert_response :success
      assert_template :edit
      assigns[:event].time.wont_be_nil
    end

    it "should redirect to events when event not found" do
      log_in_user

      get :edit, id: 10

      assert_redirected_to events_path
      flash[:alert].wont_be_nil
    end

    it "should redirect to events when not event owner" do
      log_in_user 200

      get :edit, id: event.id

      assert_redirected_to events_path
      flash[:alert].wont_be_nil
    end

    it "should redirect to events when not logged user" do
      get :edit, id: 10

      assert_redirected_to root_path
      flash[:notice].wont_be_nil
    end
  end

  describe "update" do
    it "should be able to update my events" do
      log_in_user

      put :update, id: event.id, event: params

      assert_redirected_to events_path
      flash[:notice].wont_be_nil
    end

    it "should redirect to events when event not found" do
      log_in_user

      put :update, id: 10, event: params

      assert_redirected_to events_path
      flash[:alert].wont_be_nil
    end

    it "should redirect to events when not event owner" do
      log_in_user 200

      put :update, id: event.id, event: params

      assert_redirected_to events_path
      flash[:alert].wont_be_nil
    end

    it "should redirect to events when not logged user" do
      put :update, id: 10, event: params

      assert_redirected_to root_path
      flash[:notice].wont_be_nil
    end

    it 'render edit view when update params are invalid' do
      log_in_user

      invalid_params = params.merge({ name: '' })
      put :update, id: event.id, event: invalid_params

      assert_response :success
      assert_template :edit
      flash.now[:alert].wont_be_nil
    end
  end

  describe 'destroy' do
    it 'should be able to destroy my events' do
      log_in_user

      delete :destroy, id: event.id

      assert_redirected_to events_path
      flash[:notice].wont_be_nil
    end

    it 'should not destroy when not event owner' do
      log_in_user 200

      delete :destroy, id: event.id

      assert_redirected_to events_path
      flash[:alert].wont_be_nil
    end

    it 'should redirect to events when not event found' do
      log_in_user

      delete :destroy, id: 10

      assert_redirected_to events_path
      flash[:alert].wont_be_nil
    end

    it 'should redirect to events when not logged user' do
      delete :destroy, id: event.id

      assert_redirected_to root_path
      flash[:notice].wont_be_nil
    end
  end

  describe 'show' do
    it "should display an existing event" do
      get :show, id: event.id

      assert_response :success
      assert_template :show
    end
  end

  describe 'index' do
    it "display first 4 upcoming event and 3 last passed events" do
      6.times do |index|
        Event.create name: "Upcomming #{index}",
          address: 'Carretera Manzanillo-Cihuatlán kilómetro 20,Manzanillo, Colima',
          location: 'Manzanillo', description: 'Cool conf',
          contact: 'mg@crowdint.com', organizer: 'Crowdint',
          date: Date.today + (10 * (index + 1)),
          identity_id: 100

        Event.new(name: "Past #{index}",
                  address: 'Carretera Manzanillo-Cihuatlán kilómetro 20,Manzanillo, Colima',
                  location: 'Manzanillo', description: 'Cool conf',
                  contact: 'mg@crowdint.com', organizer: 'Crowdint',
                  date: Date.today - (10 * (index + 1)),
                  identity_id: 100).save(validate: false)
      end

      get :index

      assert_response :success
      assert_template :index

      assigns[:current_events].size.must_equal 4
      assigns[:past_events].size.must_equal 3
    end
  end
end
