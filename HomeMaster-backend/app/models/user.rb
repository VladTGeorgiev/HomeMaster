class User < ApplicationRecord
  belongs_to :home
  has_many :bill_splits, dependent: :destroy 
  has_many :bills, through: :bill_splits
  has_many :tasks
  has_secure_password
  # has_one_attached :avatar
  # before_create :default_image
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  # validates :first_name, length: { minimum: 3 }
  # validates :last_name, length: { minimum: 3 }
  # validates :password, length: {minimum: 3}, on: :create
  default_scope -> { order(id: :asc) }

  # def default_image
  #   self.avatar.attach(io: File.open(Rails.root.join('app','assets','default_image.png')), filename: 'default-image.png', content_type: 'image/png')
  # end
end
