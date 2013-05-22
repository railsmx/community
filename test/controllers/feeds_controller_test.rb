require "test_helper"

describe FeedsController do

  describe "using xml as format" do
    it "should get show" do
      get :show, format: 'xml'
      assert_response :success
    end

    it "should render xml" do
      get :show, format: 'xml'
      assert_template :show
    end
  end
  
  describe "using rss as format" do
    it "should get show" do
      get :show, format: 'rss'
      assert_response :success
    end

    it "should render rss" do
      get :show, format: 'rss'
      assert_template :show
    end
  end
end