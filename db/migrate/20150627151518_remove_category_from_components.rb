class RemoveCategoryFromComponents < ActiveRecord::Migration
  def change
    remove_column :components, :category, :integer
  end
end
