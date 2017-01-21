require 'rails_helper'

describe Booking, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:hotel) }
  it { is_expected.to belong_to(:room) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:hotel_id) }
  it { is_expected.to validate_presence_of(:room_id) }
  it { is_expected.to validate_presence_of(:check_in_date) }
  it { is_expected.to validate_presence_of(:check_out_date) }

  describe '.current scope' do
    let!(:booking1) { FactoryGirl.create(:booking,
                                         check_in_date: Date.today - 2.days,
                                         check_out_date: Date.today + 1.days
                                         )
                    }

    let!(:booking2) { FactoryGirl.create(:booking,
                                         check_in_date: Date.today + 5.days,
                                         check_out_date: Date.today + 10.days
                                         )
                    }

    it 'returns the requested booking' do
      start_date = Date.today
      end_date = Date.today + 3.days

      bookings = Booking.current(1, start_date, end_date)
      expect(bookings).to eq([booking1])
    end
  end
end
