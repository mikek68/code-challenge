class Room < ActiveRecord::Base

  belongs_to :hotel
  belongs_to :room_type

  def room_label
    "#{self.room_number} - #{self.room_type.name}"
  end
end
