require "test_helper"

describe Identity do
  let(:identity_valid) { identity_valid = Identity.find_by_uid('3345444') }
  let(:identity_invalid) { identity_invalid = Identity.new }

  let(:auth) { auth = { "provider" => 'github', "uid" => '3345444', "info" => { "nickname" => 'test_user',
    "email" => 'test@user.com' } } }

  describe "Validations" do
    it "must be valid" do
      identity_valid.valid?.must_equal true
    end

    it "must be invalid" do
      identity_invalid.valid?.must_equal false
      identity_invalid.errors.size.must_equal 3
      identity_invalid.errors[:uid].wont_be_nil
      identity_invalid.errors[:provider].wont_be_nil
      identity_invalid.errors[:username].wont_be_nil
      identity_invalid.errors[:email].wont_be_nil
    end
  end

  describe "Create identity" do
    it "must create identity with valid auth" do
      identity = Identity.create_with_omniauth(auth)
      identity.valid?.must_equal true
    end

    it "must not create identity with invalid auth" do
      lambda { Identity.create_with_omniauth }.must_raise ArgumentError
      lambda { Identity.create_with_omniauth([]) }.must_raise TypeError
    end
  end

  describe "Publishers login validation" do
    before do
      Rails.application.config.publishers = 'test@user.com'
    end

    it "must be able to login if current identity is publisher" do
      identity_valid.is_publisher?.must_equal true
    end

    it "must not be able to login if current identity isn't publisher" do
      identity_invalid.is_publisher?.must_equal false
    end
  end
end
