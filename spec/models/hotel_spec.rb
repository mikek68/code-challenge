require 'rails_helper'

describe Hotel, type: :model do
  it { is_expected.to have_many(:rooms) }
  it { is_expected.to have_many(:room_types) }
  it { is_expected.to have_many(:bookings) }

  describe 'selecting available rooms' do
    let!(:hotel) { FactoryGirl.create(:hotel) }
    let!(:room1) { FactoryGirl.create(:room, hotel_id: hotel.id) }
    let!(:room2) { FactoryGirl.create(:room, hotel_id: hotel.id) }
    let!(:room3) { FactoryGirl.create(:room, hotel_id: hotel.id) }

    let!(:booking) { FactoryGirl.create(:booking,
                                        hotel_id: hotel.id,
                                        room_id: room1.id,
                                        user_id: 1,
                                        check_in_date: DateTime.now,
                                        check_out_date: DateTime.now + 5.days
                                        )
                    }

    describe '.booked_rooms' do
      it 'returns room 1' do
        expect(hotel.booked_rooms(DateTime.now - 1.days, DateTime.now + 3.days)).to eq([room1.id])
      end
    end

    describe '.available_rooms' do
      it 'returns rooms 2 and 3' do
        expect(hotel.available_rooms((DateTime.now - 1.days).to_s, (DateTime.now + 3.days).to_s)).to eq([room2, room3])
      end
    end
  end
end
