class Event < ActiveRecord::Base
  before_validation :set_date

  belongs_to :identity

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  #extend FriendlyId
  #friendly_id :name, :use => :slugged

  attr_accessor :time

  validates :name, :date, :location, :address, :contact, :identity_id, presence: true
  validates :date, future_date: true

  scope :current_events, -> (counts) { where('date > ?', DateTime.now).order('date ASC').limit(counts) }
  scope :past_events, -> (counts) { where('date <= ?', DateTime.now).order('date DESC').limit(counts) }

  class << self
    def my_event(event_id, identity)
      where(:id => event_id, :identity_id => identity.id).first
    end
  end

  def time
    return date.to_s(:custom_time) if date && date.to_s(:custom_time) != '00:00'
    @time
  end

  private
  def set_date
    return if self.date.nil? || self.time.nil?
    
    current_date = date.to_s(:custom_date)
    self.date = DateTime.parse "#{current_date} #{self.time}"
  end
end
