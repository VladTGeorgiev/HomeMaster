class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :home_id
end
