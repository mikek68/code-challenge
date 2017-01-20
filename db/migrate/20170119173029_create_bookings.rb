class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :hotel_id
      t.integer :room_id
      t.string  :stay_description
      t.datetime :check_in_date
      t.datetime :check_out_date

      t.timestamps
    end
  end
end
