class CreateJoinTableCategoryAttribute < ActiveRecord::Migration
  def change
    create_join_table :categories, :attributes do |t|
      t.index [:category_id, :attribute_id]
      # t.index [:attribute_id, :category_id]
    end
  end
end
