ActionMailer::Base.smtp_settings = {
  :address  => 'smtp.sendgrid.net',
  :port     => 587,
  :domain   => ENV['APP_DOMAIN'],
  :user_name => ENV['SENDGRID_USERNAME'],
  :password   => ENV['SENDGRID_PASSWORD'],
  :autentication => :plain,
  :enable_starttls_auto => true
}
