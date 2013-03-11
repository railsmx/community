require "minitest_helper"

describe EventController do
  it "should get new"
    get :new

    assert_response :success
    assert_template :new
  end

describe "invalid date" do
  it "should redirect with valid fields"
  end




end