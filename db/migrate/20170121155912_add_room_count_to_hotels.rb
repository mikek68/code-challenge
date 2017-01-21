class AddRoomCountToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :rooms_count, :integer, default: 0
  end
end
