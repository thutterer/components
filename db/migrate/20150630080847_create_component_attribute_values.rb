class CreateComponentAttributeValues < ActiveRecord::Migration
  def change
    create_table :component_attribute_values do |t|
      t.belongs_to :component, index: true
      t.belongs_to :attribute, index: true
      t.string :value
      t.timestamps null: false
    end
  end
end
