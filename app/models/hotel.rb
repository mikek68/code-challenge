class Hotel < ActiveRecord::Base

  has_many :rooms
  has_many :room_types
  has_many :bookings
  has_many :users, through: :bookings

  def available_rooms(start_date, end_date)
    self.rooms.where.not(id: booked_rooms(DateTime.parse(start_date), DateTime.parse(end_date)).map(&:room_id))
  end

  def booked_rooms(start_date, end_date)
    self.bookings.where('((julianday(?) - julianday(check_out_date)) * (julianday(check_in_date) - julianday(?)) >= 0)', start_date, end_date)
  end
end
