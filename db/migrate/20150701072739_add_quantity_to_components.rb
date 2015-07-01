class AddQuantityToComponents < ActiveRecord::Migration
  def change
    add_column :components, :quantity, :integer
  end
end
