class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :home_id

  # def home
  #   HomeSerializer.new(self.object.home)
  # end
end
