class RoomType < ActiveRecord::Base

  belongs_to :hotel
  has_many :rooms

  validates :hotel_id, presence: true
  validates :name, presence: true
  validates :nightly_charge, presence: true
end
