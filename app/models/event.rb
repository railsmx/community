class Event < ActiveRecord::Base
  before_validation :set_date

  belongs_to :identity

  attr_accessor :time

  validates :name, :date, :location, :contact, :identity_id, presence: true
  validates :date, future_date: true

  scope :current_events, -> (counts) { where('date > ?', DateTime.now).order('date DESC').limit(counts) }
  scope :past_events, -> (counts) { where('date <= ?', DateTime.now).order('date ASC').limit(counts) }

  class << self
    def my_event(event_id, identity)
      where(:id => event_id, :identity_id => identity.id).first
    end
  end

  def time
    return date.strftime('%H:%M') if date && date.strftime('%H:%M') != '00:00'
    @time
  end

  private
  def set_date
    return if self.date.nil? || self.time.nil?
    
    current_date = date.strftime('%Y-%m-%d')
    self.date = DateTime.parse "#{current_date} #{self.time}"
  end
end
