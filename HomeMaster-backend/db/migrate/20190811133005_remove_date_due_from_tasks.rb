class RemoveDateDueFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :date_due, :date
  end
end
