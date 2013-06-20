class HomeController < ApplicationController
  before_action :current_events, only: [:index, :show]
  before_action :current_posts, only: [:index, :show]

  def index; end

  def show
    pages = %w(acerca privacidad guia-blog)
    page = params[:id] || ''

    return render page.downcase if pages.include?(page.downcase)
    render_error 404
  end
end
