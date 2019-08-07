class Bill < ApplicationRecord
  belongs_to :home
  has_many :billsplits
  has_many :users, through: :billsplits
end
