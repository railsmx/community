class EventsController < ApplicationController
  def new
    @event =  Event.new
  end 

  def create
    # Crear un nuevo evento a partir de los parametros
    # Si valid? entonces hay que .save
    # y hacer redirect a events_path

    @event = Event.new(create_params)

    if @event.valid?
      @event.save
      return redirect_to events_path, notice: t('.event_created')
    end
     
    render :new
  end
  
  def update

    
  end 

  def destroy
  	@event.destroy
  end

  private
  def create_params
    params.require(:event)
      .permit(:name, :location, :description, :contact, :organizer, :'date(1i)', :'date(2i)', :'date(3i)', :'date(4i)', :'date(5i)')
  end
end