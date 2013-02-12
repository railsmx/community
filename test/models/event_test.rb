require "minitest_helper"

describe Event do
  before do
    @event = Event.new
  end

  it "must be valid" do
    @event.valid?.must_equal true
  end
end
