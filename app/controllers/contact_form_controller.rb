class ContactFormController < ApplicationController
  before_action :current_events, only: [:create]
  before_action :current_posts

  def new
    current_events
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    @contact_form.request = request

    return render :new unless @contact_form.valid?

    @contact_form.deliver
    redirect_to root_url, notice: t('.message_sent')
  end
end
