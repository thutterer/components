class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
