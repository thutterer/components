class AddRoomIdToComponent < ActiveRecord::Migration
  def change
    add_column :components, :room_id, :integer
  end
end
