class Event < ActiveRecord::Base
  belongs_to :identity
  
	attr_accessor :time

	validates :name, :date, :location, :contact, :identity_id, presence: true
	validates :date, future_date: true
end
