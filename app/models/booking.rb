class Booking < ActiveRecord::Base

  belongs_to :user
  belongs_to :hotel
  belongs_to :room

  scope :current, -> (user_id, month_start, month_end) { where(user_id: user_id).where('check_in_date >= ? or check_out_date <= ?', month_start, month_end)}
end
