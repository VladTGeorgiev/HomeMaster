class CreateHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :homes do |t|
      t.string :name
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :postcode
      t.string :home_key

      t.timestamps
    end
  end
end
