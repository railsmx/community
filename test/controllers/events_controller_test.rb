require "minitest_helper"

describe EventsController do
  let(:params) {
  { name: 'MagmaConf',
                location: 'Manzanillo',
                description: 'Cool conf',
                contact: 'mg@crowdint.com',
                organizer: 'Crowdint',
                date: '28/2/2015',
                time: '5:05 pm' }
  }

  let(:event) { Event.create name: 'MagmaConf',
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
      flash[:alert].wont_be_nil
    end
  end

  describe "create" do
    it "should create new event for logged user" do
      log_in_user

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
  end

  describe 'show' do
    it "should display an existing event" do
      get :show, id: event.id

      assert_response :success
      assert_template :show
    end

    it "should redirect to events when event not found" do
      get :show, id: 10

      assert_redirected_to events_path
      flash[:alert].wont_be_nil
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
