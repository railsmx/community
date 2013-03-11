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

  it "should get new" do
    get :new

    assert_response :success
    assert_template :new
  end

  describe "create" do

    it "should create new event" do
      post :create, event: params

      assert_response 302
      assert_redirected_to '/events'
      flash[:notice].wont_be_nil
    end

    it "should display new form when fail to create event" do
      post :create, event: { name: 'MagmaConf' }

      assert_response :success
      assert_template :new
      flash[:error].must_be_nil
    end
  end

  describe "edit" do

    it "should fetch event for edit" do
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
end