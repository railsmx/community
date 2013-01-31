class HomeController < ApplicationController

  @contact_form = ContactForm.new(params[:contact_form])
  @contact_form.request = request

  def index
  
  end

  def show
    pages = %w(acerca contacto privacidad)
    page = params[:id] || ''

    return render page.downcase if pages.include?(page.downcase)

    render text: 'Not found', status: 404
  end


end
