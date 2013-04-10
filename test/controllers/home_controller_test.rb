require "test_helper"

describe HomeController do
  it "should get index" do
    get :index
    assert_response :success
  end

  it "should get show with 'acerca' parameter" do
    get :about, id: 'acerca'

    assert_response :success
    assert_template 'about'
  end

  it "should get show with 'privacidad' parameter" do
    get :privacy, id: 'privacidad'

    assert_response :success
    assert_template 'privacy'
  end

  it "should get 404 on show with invalid parameter" do
    get :show, id: 'invalid'

    assert_response 404    
  end

end
