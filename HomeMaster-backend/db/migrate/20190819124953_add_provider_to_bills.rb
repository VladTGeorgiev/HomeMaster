class AddProviderToBills < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :provider, :string
  end
end
