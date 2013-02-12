class Event < ActiveRecord::Base
	validates :name, :date, :location, :contact, presence: true
	validates :date, future_date: true

end
