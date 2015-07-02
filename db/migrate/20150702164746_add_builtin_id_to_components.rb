class AddBuiltinIdToComponents < ActiveRecord::Migration
  def change
    add_column :components, :component_id, :integer
  end
end
