require "minitest_helper"

describe EventsController do
  let(:params) { { name: 'MagmaConf',
                location: 'Manzanillo',
                description: 'Cool conf',
                contact: 'mg@crowdint.com',
                organizer: 'Crowdint',
                date: '28/2/2015',
                time: '5:05 pm' } }

  let(:event) { Event.create name: 'MagmaConf',
                location: 'Manzanillo', description: 'Cool conf',
                contact: 'mg@crowdint.com', organizer: 'Crowdint',
                date: Date.today + 10
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
      flash[:alert].wont_be_nil
    end
  end

  describe "create" do
    focus
    it "should create new event for logged user" do
      log_in_user

      post :create, event: params

      assert_redirected_to events_path
      flash[:notice].wont_be_nil
    end

    focus
    it "should not create new event when not logged user" do
      post :create, event: params

      assert_redirected_to root_path
      flash[:alert].wont_be_nil
    end

    focus
    it "should not create new event when params are invalid" do
      post :create, event: {}

      assert_response :success
      assert_template :new
      flash[:alert].wont_be_nil
    end
  end

  describe "edit" do

    it "should edit event when logged user" do
      log_in_user

      get :edit, id: event.id

      assert_response :success
      assert_template :edit
    end

    it "should display an error when event could not be found" do
      get :edit, id: 10

      assert_response 302
      assert_redirected_to '/events'
      flash[:error].must_be_nil
    end
  end

  describe "update" do

    it "should update event" do
      new_params = params.merge({id: event.id})

      post :create, event: new_params
      assert_response 302
      assert_redirected_to '/events'
      flash[:notice].wont_be_nil
    end
  end

  # describe "index" do

  #   it "should show the events"
  #     get :index
  #   end

  #   it "should show nearest events"

  #   end

  #   it "should show lastest events"

  #   end
  # end
end
