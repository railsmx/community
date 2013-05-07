class Identity < ActiveRecord::Base
  has_many :events

  validates :uid, :provider, :username, :email, presence: true

  scope :my_identity, -> (uid, provider) { where(uid: uid, provider: provider) }

  def self.create_with_omniauth(auth)
    create! do |identity|
      identity.provider = auth['provider']
      identity.uid = auth['uid']
      identity.username = auth['info']['nickname']
      identity.email = auth['info']['email']
    end
  end

  def is_publisher?
    Rails.application.config.publishers.delete(' ').split(',').include? self.email
  end
end
