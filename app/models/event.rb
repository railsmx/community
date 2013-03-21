class Event < ActiveRecord::Base
  belongs_to :identity
  
	attr_accessor :time

	validates :name, :date, :location, :contact, :identity_id, presence: true
	validates :date, future_date: true

  scope :current_events, -> (counts) { where("date > ?", DateTime.now).order("date DESC").limit(counts) }
  scope :past_events, -> (counts) { where("date <= ?", DateTime.now).order("date ASC").limit(counts) }

	class << self
  	def my_event(event_id, identity)
      where(:id => event_id, :identity_id => identity.id).first
  	end
	end
end