class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :title
      t.integer :category

      t.timestamps null: false
    end
  end
end
