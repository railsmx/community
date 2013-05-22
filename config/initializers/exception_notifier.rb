Rails.application.config.middleware.use ExceptionNotifier,
email: {
  email_prefix: "#{ENV['THEME'].downcase} Exception Notifier ",
  sender_address: %{"notifier" <#{ENV['EMAIL_NOTIFIER'].split(',')}>},
  exception_recipients: ENV['EMAIL_NOTIFIER'].split(',')
}
