class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :room_number
      t.integer :hotel_id
      t.integer :room_type_id

      t.timestamps
    end
  end
end
