class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_identity, :identity_signed_in?, :warden

  private
  def warden
  	request.env['warden']
  end

  def identity_signed_in?
    warden.authenticate?(scope: :identity)
  end

  def current_identity
    warden.user(scope: :identity)
  end
end
