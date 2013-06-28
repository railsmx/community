if Rails.env.production?
  Rails.application.config.middleware.use ExceptionNotification::Rack,
  email: {
    email_prefix: "#{ENV['THEME'].downcase} Exception Notifier ",
    sender_address: %{"notifier" <errors@rails.mx>},
    exception_recipients: ENV['EXCEPTION_RECIPIENTS'].split(',')
  }
end
