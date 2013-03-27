class HomeController < ApplicationController

  def index
    @current_events = Event.current_events(2)
  end

  def show
    pages = %w(acerca privacidad)
    page = params[:id] || ''
    return render page.downcase if pages.include?(page.downcase)
    render text: 'Not found', status: 404
  end


end
