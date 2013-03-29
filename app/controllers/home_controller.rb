class HomeController < ApplicationController
  before_action :current_events, only: [:index, :privacy, :about]
  
  def index
  end

  def show
    pages = %w(acerca privacidad)
    page = params[:id] || ''
    return render page.downcase if pages.include?(page.downcase)
    render text: 'Not found', status: 404
  end

  def privacy
  end

  def about 
  end
end
