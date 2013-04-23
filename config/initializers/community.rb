theme = ENV['THEME'] || ''

theme = 'railsmx' if Rails.env.test?

Rails.application.config.theme = theme.downcase
Rails.application.config.assets.precompile += ["#{theme.downcase}.css", "#{theme.downcase}.js"]

# Facebook_AppID
Rails.application.config.facebook_appid = ENV['FACEBOOK_APPID']
