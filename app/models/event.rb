class Event < ActiveRecord::Base
	attr_accessor :time

	validates :name, :date, :location, :contact, presence: true
	validates :date, future_date: true
end
