class BillSerializer < ActiveModel::Serializer
  attributes :id, :name, :total, :date_due, :home_id
end
