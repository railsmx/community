class EventController < ApplicationController
  def new
    @event =  Event.new
  end 

  def create
     @event = Event.new(params[])
  end
  
