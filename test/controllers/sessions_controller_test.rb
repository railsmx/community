require "test_helper"

describe SessionsController do
  let(:params) {
    { 'provider' => 'github', 'uid' => '11223344',
      'info' => { 'nickname' => 'Test user', 'email' => 'test@user.com' }
    }
  }

  describe 'create' do
    it 'success authentication first time user' do
      @controller.request.env['omniauth.auth'] = params
      post :create

      assert_redirected_to root_path
      Identity.my_identity('11223344', 'github').wont_be_empty
    end

    it 'success authentication for returning user' do
      Identity.create_with_omniauth params
      @controller.request.env['omniauth.auth'] = params
      post :create

      assert_redirected_to root_path
    end

    it 'rejected authentication' do
      identity = Identity.create_with_omniauth params
      identity.tap do |i|
        i.blocked = true
        i.save
      end

      @controller.request.env['omniauth.auth'] = params
      lambda{ post :create }.must_raise(ArgumentError)
    end
  end

  describe 'destroy' do
    it 'success logout' do
      delete :destroy

      assert_redirected_to root_path
    end
  end
end
