class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
