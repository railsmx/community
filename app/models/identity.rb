class Identity < ActiveRecord::Base
	def self.create_with_omniauth(auth)
		create! do |identity|
		identity.provider = auth["provider"]
		identity.uid = auth["uid"]
		identity.name = auth["info"]["name"]
		end
	end
end
