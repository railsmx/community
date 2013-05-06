Crowdblog.user_class = 'Identity'

Rails.application.config.discus_key = '434324234'
Rails.application.config.publishers = 'guillermo.moreno@crowdint.com, angel.solorio@crowdint.com, jmemox@gmail.com'


if Rails.env.test?
	Rails.application.config.publishers = 'test@user.com'
end