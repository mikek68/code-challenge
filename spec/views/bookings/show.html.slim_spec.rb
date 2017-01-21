require 'rails_helper'

describe "bookings/show", type: :view do
  before(:each) do
    sign_in user
    @booking = assign(:booking, booking)
  end

  let!(:user) { FactoryGirl.create(:user) }
  let!(:hotel) { FactoryGirl.create(:hotel) }
  let!(:room) { FactoryGirl.create(:room) }
  let!(:booking) { FactoryGirl.create(:booking, room_id: room.id, hotel_id: hotel.id, user_id: user.id) }

  it "renders attributes" do
    render
    expect(render).to include('<h1>Booking</h1>')
    expect(render).to include('<p class="fields">')
    expect(render).to include('<span class="field">Check In Date:</span>')
    expect(render).to include('<span class="field">Check Out Date:</span')
    expect(render).to include('<span class="field">Hotel:</span>')
    expect(render).to include('<span class="field">Room:</span>')
    expect(render).to include('<span class="field">Stay Description:</span>')
  end
end
