class Task < ApplicationRecord
  belongs_to :home
  belongs_to :user
  default_scope -> { order(id: :asc) }
end
