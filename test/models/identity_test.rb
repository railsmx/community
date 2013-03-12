require "minitest_helper"

describe Identity do
  before do
    @identity = Identity.new
  end

  it "must be valid" do
    @identity.valid?.must_equal true
  end
end
