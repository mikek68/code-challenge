class Booking < ActiveRecord::Base

  belongs_to :user
  belongs_to :hotel
  belongs_to :room
  has_one :charge

  scope :current, -> (user_id, month_start, month_end) { where(user_id: user_id).where('check_in_date BETWEEN ? and ? or check_out_date BETWEEN ? and ?', month_start, month_end, month_start, month_end)}

  validates :user_id, presence: true
  validates :hotel_id, presence: true
  validates :room_id, presence: true
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true

  def charges_in_cents
    (total_charges * 100).to_i
  end

  def total_charges
    (number_of_days_stay * room.room_type.nightly_charge).to_f
  end

  def number_of_days_stay
    days = (check_out_date.to_date - check_in_date.to_date).to_i
    (days === 0 ? 1 : days)
  end

  def description
    "Hotel: #{self.hotel.name}, Room: #{self.room.room_label}"
  end
end
