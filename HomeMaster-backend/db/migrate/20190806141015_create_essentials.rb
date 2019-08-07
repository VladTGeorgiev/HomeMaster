class CreateEssentials < ActiveRecord::Migration[5.2]
  def change
    create_table :essentials do |t|
      t.string :name
      t.boolean :more
      t.references :home, foreign_key: true

      t.timestamps
    end
  end
end
