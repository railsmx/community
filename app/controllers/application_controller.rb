class ApplicationController < ActionController::Base
  prepend_view_path "app/views/#{Rails.application.config.theme}"

  protect_from_forgery with: :exception

  helper_method :current_identity, :identity_signed_in?, :warden,
    :crowdblog_current_user, :crowdblog_authenticate_user!

  if Rails.env.production?
    rescue_from ActionController::RoutingError,
                ActiveRecord::RecordNotFound,
                ActionView::MissingTemplate,
                with: lambda { |exception| render_error 404 }
  end

  def raise_not_found!
    raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
  end

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

  def current_posts
    @current_posts = Crowdblog::Post.last_published(3)
  end

  def crowdblog_current_user
    current_identity
  end

  def crowdblog_authenticate_user!
    redirect_to crowdblog.root_path unless
      identity_signed_in? and current_identity.is_publisher?
  end

  def render_error(status)
    render template: "errors/#{status}.html", status: status, layout: false
  end
end

