class AddCategoryRefToComponents < ActiveRecord::Migration
  def change
    add_reference :components, :category, index: true, foreign_key: true
  end
end
