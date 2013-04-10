class HomeController < ApplicationController
  before_action :current_events, only: [:index, :privacy, :about]
  
  def index; end

  def show
    pages = %w(about privacy)
    page = params[:id] || ''

    return render page.downcase if pages.include?(page.downcase)
    render text: 'not found', status: 404
  end

  def privacy; end

  def about; end
end
