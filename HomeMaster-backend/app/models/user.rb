class User < ApplicationRecord
  belongs_to :home
  has_secure_password
  # before_create :default_image
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  # def default_image
  #   self.avatar.attach(io: File.open(Rails.root.join('app','assets', 'images', 'default_image.png')), filename: 'default-image.png', content_type: 'image/png')
  # end
end
