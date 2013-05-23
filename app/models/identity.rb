class Identity < ActiveRecord::Base
  has_many :events

  validates :uid, :provider, :username, presence: true

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
    if Rails.application.config.publishers.nil?
      Rails.logger.info "Variable 'publishers' no inicializada..."
      return false;
    end

    Rails.application.config.publishers.delete(' ').split(',').include? email
  end
end