require 'rails_helper'

describe RoomType, type: :model do
  it { is_expected.to belong_to(:hotel) }
  it { is_expected.to have_many(:rooms) }
  it { is_expected.to validate_presence_of(:hotel_id) }
  it { is_expected.to validate_presence_of(:name) }
end
