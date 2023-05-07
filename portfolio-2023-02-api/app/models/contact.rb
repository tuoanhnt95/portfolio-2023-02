class Contact
  include ActiveModel::Model

  attr_accessor :name, :email, :subject, :message
  validates :email, :message, presence: true
end

# class Contact < ApplicationRecord
# end
