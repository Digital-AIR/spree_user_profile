class AddLastNameToSpreeUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_users, :last_name, :string
  end
end
