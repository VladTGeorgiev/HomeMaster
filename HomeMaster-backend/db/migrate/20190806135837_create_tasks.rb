class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.string :img
      t.date :date_due
      t.boolean :completed
      t.references :home, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
