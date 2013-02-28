class EventsController < ApplicationController
  
  def index
    @event = Event.order("date DESC").limit(3)
    @oldevent = Event.order("date ASC").limit(3)
    #@event = Event.all

  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event =  Event.new
  end 

  def create
    # Crear un nuevo evento a partir de los parametros
    # Si valid? entonces hay que .save
    # y hacer redirect a events_path
    @event = Event.new(create_params).tap do |event|
      event.date = "#{params[:event][:date]} #{params[:event][:time]}"
    end

    if @event.valid?
      @event.save
      return redirect_to events_path, notice: t('.event_created')
    end
    
    @event.date = params[:event][:date]
    render :new
  end

  def edit
    @event = Event.find_by_id params[:id]
    
    return redirect_to events_path, notice: t('.event_not_found') unless @event
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