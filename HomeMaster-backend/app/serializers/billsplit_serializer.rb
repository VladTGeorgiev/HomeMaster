class BillsplitSerializer < ActiveModel::Serializer
  attributes :id, :paid, :amount, :home_id, :user_id
end
