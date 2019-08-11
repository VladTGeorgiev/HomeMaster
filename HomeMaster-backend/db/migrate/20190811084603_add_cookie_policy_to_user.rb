class AddCookiePolicyToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cookie_policy, :boolean
  end
end
