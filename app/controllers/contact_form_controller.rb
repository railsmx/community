class ContactFormController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    @contact_form.request = request

    unless @contact.valid?
      return render :new
    end

    redirect_to root_url, notice: t('.message_sent')
  end
end
