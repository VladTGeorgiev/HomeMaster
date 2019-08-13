class Essential < ApplicationRecord
  belongs_to :home
  default_scope -> { order(id: :asc) }
end
