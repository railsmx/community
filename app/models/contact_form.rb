class ContactForm < MailForm::Base
  attributes :name,  :validate => true
  attribute :email
  attributes :message

  validates_format_of :email,
    :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

   def headers
    {
      :subject => "Correo de prueba",
      :to => "test.blog.mx@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end