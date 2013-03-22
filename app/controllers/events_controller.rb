class EventsController < ApplicationController
  before_action :authenticate!, except: [:index, :show]

  def index
    @current_events = Event.current_events(4)
    @past_events = Event.past_events(3)
  end

  def show
    @event = Event.find_by_id params[:id]

    redirect_to events_path, alert: t('.event_not_found') unless @event
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(create_params).tap do |event|
      #event.date = "#{params[:event][:date]} #{params[:event][:time]}"
      event.identity = current_identity
    end

    return redirect_to events_path, notice: t('.event_created') if @event.save

    flash.now[:alert] = t('.invalid_event')
    @event.date = params[:event][:date]
    render :new
  end

  def edit
    @event = Event.my_event params[:id], current_identity

    redirect_to events_path, alert: t('.event_not_found') unless @event

    @event.time = @event.date.strftime('%H:%M')
    @event.date = @event.date.strftime('%Y-%m-%d')
  end

  def update
    @event = Event.my_event params[:id], current_identity
    
    updated = @event.update_attributes create_params if @event
    Rails.logger.debug @event.inspect

    messages = calculate_redirect_message @event, updated, 'updated'
    return redirect_to events_path, messages unless messages.empty?

    flash.now[:alert] = t('.invalid_event')
    @event.date = params[:event][:date]
    render :edit
  end

  def destroy
    @event = Event.my_event params[:id], current_identity

    deleted = @event.destroy if @event
    messages = calculate_redirect_message @event, deleted, 'deleted'

    redirect_to events_path, messages
  end

  private
  def calculate_redirect_message(model, saved, key='')
    if !model
      { alert: t('.event_not_found') }
    elsif saved
      { notice: t(".event_#{key}") }
    end || {}
  end

  def create_params
    params.require(:event).permit(:name, :location, :description, :contact, :organizer, :date, :time)
  end
end
