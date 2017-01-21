class AddNightlyChargeToRoomTypes < ActiveRecord::Migration
  def change
    add_column :room_types, :nightly_charge, :decimal, precision: 5, scale: 2
  end
end
