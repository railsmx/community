ActionMailer::Base.smtp_settings = {
  :address  => "smtp.gmail.com", 
  :port     => 587,
  :domain   => 'rails.mx',
  :user_name => 'test.blog.mx@gmail.com',
  :password   => 'payaso21.',
  :autentication => 'plain',
  :enable_starttls_auto => true
}