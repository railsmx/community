require "minitest_helper"

describe EventsController do
  it "should get new" do
    get :new

    assert_response :success
    assert_template :new
  end

  describe "create" do
    let(:params) { { name: 'MagmaConf', 
                    location: 'Manzanillo',
                    description: 'Cool conf',
                    contact: 'mg@crowdint.com',
                    organizer: 'Crowdint',
                    "date(1i)" => 2013,
                    "date(2i)" => 6,
                    "date(3i)" => 6,
                    "date(4i)" => 12,
                    "date(5i)" => 0 } }

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
      flash[:notice].must_be_nil
    end
  end
#describe "invalid date" do
#  it "should redirect with valid fields" do
#  end

end