class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.string :name
      t.float :total
      t.date :date_due
      t.references :home, foreign_key: true

      t.timestamps
    end
  end
end
