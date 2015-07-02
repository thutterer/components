class AddWarrantyToComponents < ActiveRecord::Migration
  def change
    add_column :components, :warranty, :date
  end
end
