class Identity < ActiveRecord::Base
  :uid, :provider, :username, :email, presence: true

	def self.create_with_omniauth(auth)
		create! do |identity|
		identity.provider = auth["provider"]
		identity.uid = auth["uid"]
		identity.username = auth["info"]["username"]
    identity.email = auth["info"]["email"]
		end
	end
end
