require "test_helper"

describe AtomFeedsController do

  before :each do
    get :show, format: 'xml'
  end
  
  it "should get show" do
    assert_response :success
  end

  it "should render xml" do
    assert_template :show
  end
end