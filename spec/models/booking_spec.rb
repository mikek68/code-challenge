require 'rails_helper'

describe Booking, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:hotel) }
  it { is_expected.to belong_to(:room) }
  it { is_expected.to have_one(:charge) }
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

  describe '.description' do
    before do
      allow(booking).to receive_message_chain(:hotel, :name).and_return('Test Hotel')
      allow(booking).to receive_message_chain(:room, :room_label).and_return('100 - Suite')
    end

    let!(:booking) { FactoryGirl.create(:booking) }

    it 'returns the description' do
      expect(booking.description).to eq('Hotel: Test Hotel, Room: 100 - Suite')
    end
  end

  describe '.number_of_days_stay' do
    let!(:booking) { FactoryGirl.create(:booking, check_in_date: DateTime.now, check_out_date: DateTime.now + 2.days) }

    it 'calculates the number of days' do
      expect(booking.number_of_days_stay).to eq(2)
    end
  end

  describe '.total_charges' do
    before do
      allow(booking).to receive_message_chain(:room, :room_type, :nightly_charge).and_return(20.0)
    end
    let!(:booking) { FactoryGirl.create(:booking, check_in_date: DateTime.now, check_out_date: DateTime.now + 2.days) }

    it 'calculates the total charges' do
      expect(booking.total_charges).to eq(40.0)
    end
  end

  describe '.charges_in_cents' do
    before do
      allow(booking).to receive_message_chain(:room, :room_type, :nightly_charge).and_return(20.0)
    end
    let!(:booking) { FactoryGirl.create(:booking, check_in_date: DateTime.now, check_out_date: DateTime.now + 2.days) }

    it 'calculates the total charges' do
      expect(booking.charges_in_cents).to eq(4000)
    end
  end
end
