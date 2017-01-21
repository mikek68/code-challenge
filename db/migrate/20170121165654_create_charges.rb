class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :booking_id
      t.decimal :amount, precision: 6, scale: 2

      t.timestamps
    end
  end
end
