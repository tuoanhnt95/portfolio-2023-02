# class Contact
#   include ActiveModel::Model

#   attr_accessor :name, :email, :subject, :message
#   validates :email, :message, presence: true
# end

# class Contact < ApplicationRecord
# end

class Contact < MailForm::Base
  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :subject
  attribute :message, validate: true
  attribute :nickname,  captcha: true

  def headers
    {
      :subject => %("#{subject}"),
      :cc => %("#{email}"),
      :to => "myspamvn@yahoo.com", 
      :from => %("#{name}" <#{email}>)
    }
  end
end
