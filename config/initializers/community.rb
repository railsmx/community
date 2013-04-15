ENV['THEME'] = 'railsmx' if Rails.env.test?

Rails.application.config.theme = ENV['THEME'].downcase
Rails.application.config.assets.precompile += ["#{ENV['THEME'].downcase}.css", "#{ENV['THEME'].downcase}.js"]