class AddRolesidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role_id, :integer, default: 4
  end
end
