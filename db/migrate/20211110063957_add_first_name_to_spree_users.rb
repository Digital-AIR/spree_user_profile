class AddFirstNameToSpreeUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_users, :first_name, :string
  end
end
