class ContactForm < MailForm::Base
  attributes :name, validate: true
  attribute :email
  attributes :message

  validates_format_of :email, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

   def headers
    {
      subject: "Correo de contacto de #{Rails.application.config.theme.capitalize}",
      to: Rails.application.config.contact_email,
      from: %("#{name}" <#{email}>)
    }
  end
end
