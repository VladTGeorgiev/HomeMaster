class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :home_id, :cookie_policy, :avatar
end
# 960c1f267c05af42