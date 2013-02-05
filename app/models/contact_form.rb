class ContactForm < MailForm::Base
  attributes :name,  :validate => true
  attribute :email
  validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attributes :message

   def headers
    {
      :subject => "My Contact Form",
      :to => "test.blog.mx@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end


end