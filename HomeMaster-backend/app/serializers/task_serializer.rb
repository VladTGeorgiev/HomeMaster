class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :date_due, :completed, :home_id, :user_id, :img
end
