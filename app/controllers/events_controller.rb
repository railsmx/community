class EventsController < ApplicationController
  before_action :authenticate!

  def index
    @event = Event.order("date DESC").limit(3)
    @oldevent = Event.order("date ASC").limit(3)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(create_params).tap do |event|
      event.date = "#{params[:event][:date]} #{params[:event][:time]}"
      event.identity = current_identity
    end

    return redirect_to events_path, notice: t('.event_created') if @event.save

    flash.now[:alert] = t('.invalid_event')
    @event.date = params[:event][:date]
    render :new
  end

  def edit
    @event = Event.my_event params[:id], current_identity

    return redirect_to events_path, alert: t('.event_not_found') unless @event
  end

  def update
    @event = Event.find_by_params[:id]

    if @event.update_attributes_params[:id]
      return redirect_to events_path, notice: t('event_was_updated')
      end
  end

  def destroy
    @event.destroy
  end

  private
  def create_params
    params.require(:event)
      .permit(:name, :location, :description, :contact, :organizer, :date, :time)
  end
end
