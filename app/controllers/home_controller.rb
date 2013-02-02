class HomeController < ApplicationController

  
  #@contact_form.request = request

  def index
  
  end

  def show
    
    pages = %w(acerca contacto privacidad)
    page = params[:id] || ''
    @contact_form = ContactForm.new(params[:contact_form])
    return render page.downcase if pages.include?(page.downcase)

    render text: 'Not found', status: 404
  end


end
