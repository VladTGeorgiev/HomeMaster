class Bill < ApplicationRecord
  belongs_to :home
  has_many :billsplits, dependent: :destroy 
  has_many :users, through: :billsplits
end
