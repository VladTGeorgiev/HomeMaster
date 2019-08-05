class User < ApplicationRecord
  belongs_to :home
  has_secure_password
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
