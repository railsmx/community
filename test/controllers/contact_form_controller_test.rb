require "test_helper"

describe ContactFormController do
  it "should get new" do
  	get :new

  	assert_response :success
    assert_template :new
  end

  describe "post create" do
    it "should redirect with valid fields" do
      stub_method(ContactForm, :deliver) {
        true
      }

  	  post :create, contact_form: { name: 'hce', email: 'xhce911@gmail.com', message: 'testing' }

  	  assert_response :redirect
  	  assert_redirected_to root_path
    end

    it "should render new form with invalid fields" do
      ActionMailer::Base.deliveries = []

  	  post :create, contact_form: { name: '', email: '', message: '' }

  	  assert_response :success
  	  assert_template :new

  	  ActionMailer::Base.deliveries.size.must_equal 0
    end
  end

end
