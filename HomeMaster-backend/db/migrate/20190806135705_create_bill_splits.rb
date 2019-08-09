class CreateBillSplits < ActiveRecord::Migration[5.2]
  def change
    create_table :bill_splits do |t|
      t.boolean :paid
      t.float :amount
      t.references :bill, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
