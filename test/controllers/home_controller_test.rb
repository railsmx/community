require "test_helper"

describe HomeController do
  it "should get index" do
    get :index
    assert_response :success
  end

  it "should get show with 'acerca' parameter" do
    get :show, id: 'acerca'

    assert_response :success
    assert_template 'acerca'
  end

  it "should get show with 'privacidad' parameter" do
    get :show, id: 'privacidad'

    assert_response :success
    assert_template 'privacidad'
  end
end
