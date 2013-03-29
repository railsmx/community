class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_identity, :identity_signed_in?, :warden

  protected
  def warden
    request.env['warden']
  end

  def identity_signed_in?
    warden.authenticate?(scope: :identity)
  end

  def current_identity
    warden.user(scope: :identity)
  end

  def authenticate!
    redirect_to root_path, notice: t('.not_logged') unless identity_signed_in?
  end

  def current_events
    @current_events = Event.current_events(3)
  end
end