require 'rails_helper'

describe Room, type: :model do
  it { is_expected.to belong_to(:hotel) }
  it { is_expected.to belong_to(:room_type) }
  it { is_expected.to have_many(:bookings) }
  it { is_expected.to validate_presence_of(:hotel_id) }
  it { is_expected.to validate_presence_of(:room_type_id) }
  it { is_expected.to validate_presence_of(:room_number) }

  describe '.room_label' do
    let!(:room) { FactoryGirl.create(:room) }

    it 'returns a label with room number and room type' do
      expect(room.room_label).to eq("#{room.room_number} - #{room.room_type.name}")
    end
  end
end
