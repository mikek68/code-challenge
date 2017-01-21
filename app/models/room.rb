class Room < ActiveRecord::Base

  belongs_to :hotel
  belongs_to :room_type
  has_many :bookings

  validates :hotel_id, presence: true
  validates :room_type_id, presence: true
  validates :room_number, presence: true

  def room_label
    "#{self.room_number} - #{self.room_type.name}"
  end
end
