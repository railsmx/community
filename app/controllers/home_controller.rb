class HomeController < ApplicationController
  before_action :current_events, only: [:index, :show]
  
  def index; end

  def show
    pages = %w(acerca privacidad)
    page = params[:id] || ''

    return render page.downcase if pages.include?(page.downcase)
    render text: 'not found', status: 404
  end
end
