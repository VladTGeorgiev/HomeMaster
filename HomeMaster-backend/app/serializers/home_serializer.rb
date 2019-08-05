class HomeSerializer < ActiveModel::Serializer
  attributes :id, :name, :address_one, :address_two, :city, :postcode, :home_key
end
