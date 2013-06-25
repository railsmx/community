theme = ENV['THEME'] || ''
theme = ENV['THEME'] = 'railsmx' if Rails.env.test?

Rails.application.config.theme = theme.downcase
Rails.application.config.assets.precompile += ["#{theme.downcase}.css", "#{theme.downcase}.js"]

# Facebook_AppID
Rails.application.config.facebook_appid = ENV['FACEBOOK_APPID']

Rails.application.config.contact_email = ENV['CONTACT_EMAIL']

# Twitter WidgetID
Rails.application.config.widget_id = ENV['WIDGET_ID']
