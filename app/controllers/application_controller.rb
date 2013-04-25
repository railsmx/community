class ApplicationController < ActionController::Base

def crowdblog_current_user
  current_identity
end

def crowdblog_authenticate_user!
  authenticate!
end

helper_method :crowdblog_current_user, :crowdblog_authenticate_user!

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  prepend_view_path "app/views/#{Rails.application.config.theme}"

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
    @current_events = Event.current_events(2)
  end
end

