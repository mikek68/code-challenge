class Booking < ActiveRecord::Base

  belongs_to :user
  belongs_to :hotel
  belongs_to :room

end
