class BillsplitSerializer < ActiveModel::Serializer
  attributes :id, :paid, :amount, :bill_id, :user_id
end
