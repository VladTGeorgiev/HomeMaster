class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :day, :completed, :home_id, :user_id, :img
end
