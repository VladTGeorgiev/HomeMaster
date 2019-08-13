class Bill < ApplicationRecord
  belongs_to :home
  has_many :bill_splits, dependent: :destroy 
  has_many :users, through: :bill_splits
  default_scope -> { order(id: :asc) }
end
