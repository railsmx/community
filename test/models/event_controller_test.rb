require "minitest_helper"

describe EventController do
  it "should get new" do
    get :new

    assert_response :success
    assert_template :new
  end

  describe "invalid date" do
    it "should redirect with valid fields" do
    end
  end
end