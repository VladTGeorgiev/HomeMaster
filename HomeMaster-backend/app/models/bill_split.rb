class BillSplit < ApplicationRecord
  belongs_to :bill
  belongs_to :user
  default_scope -> { order(id: :asc) }
end
