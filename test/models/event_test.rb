require "minitest_helper"

describe Event do
  let(:event) { Event.new }
  let(:identity) { Identity.first }

  it "must be invalid without attributes" do
    event.valid?.must_equal false
    event.errors.size.must_equal 6
    event.errors[:name].wont_be_nil
    event.errors[:description].wont_be_nil
    event.errors[:date].wont_be_nil
    event.errors[:location].wont_be_nil
    event.errors[:contact].wont_be_nil
    event.errors[:identity_id].wont_be_nil
  end

  it "must be invalid when date is not in future" do
    event.tap do |e|
      e.name = 'Magmaconf'
      e.location = 'Manzanillo'
      e.contact = 'Crowdint'
      e.identity = identity
      e.date = Date.today
    end

    event.valid?.must_equal false
    event.errors.size.must_equal 1
    event.errors[:date].wont_be_nil
  end

  it "must be valid" do
    event.tap do |e|
      e.name = 'MagmaConf'
      e.date = Date.today + 2
      e.location = 'Manzanillo'
      e.identity = identity
      e.contact = 'CrowdInt'
    end

    event.valid?.must_equal true
  end

  it "must combine date and time before validation" do
    event.tap do |e|
      e.date = '2013-06-01'
      e.time = '17:45'
    end

    event.valid?
    event.date.must_equal Time.zone.parse('2013-06-01 17:45')
  end

  it "must have time if date is given" do
    event.date = Time.zone.parse('2013-06-01 13:25')

    event.time.must_equal '13:25'
  end

  it "wont set time if no date is given" do
    event.time.must_be_nil
  end
end
