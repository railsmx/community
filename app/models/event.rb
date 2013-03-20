class Event < ActiveRecord::Base
  belongs_to :identity
  
	attr_accessor :time

	validates :name, :date, :location, :contact, :identity_id, presence: true
	validates :date, future_date: true
	
	class << self
  	def my_event(event_id, identity)
      where(:id => event_id, :identity_id => identity.id).first
  	end
	end
end