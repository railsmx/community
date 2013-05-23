class ContactForm < MailForm::Base
  attributes :name, validate: true
  attribute :email
  attributes :message

  validates_format_of :email, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	validates :message, presence: true

  def headers
    {
      subject: I18n.t('.subject_mail', app: ENV['THEME'].downcase),
      to: Rails.application.config.contact_email,
      from: %("#{name}" <#{email}>)
    }
  end
end