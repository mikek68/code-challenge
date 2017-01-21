class Booking < ActiveRecord::Base

  belongs_to :user
  belongs_to :hotel
  belongs_to :room

  scope :current, -> (user_id, month_start, month_end) { where(user_id: user_id).where('check_in_date BETWEEN ? and ? or check_out_date BETWEEN ? and ?', month_start, month_end, month_start, month_end)}

  validates :user_id, presence: true
  validates :hotel_id, presence: true
  validates :room_id, presence: true
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
end
