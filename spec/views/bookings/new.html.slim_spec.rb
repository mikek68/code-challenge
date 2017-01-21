require 'rails_helper'

describe "bookings/new", type: :view do
  before(:each) do
    sign_in user
    @booking = assign(:booking, Booking.new(user_id: user.id))
  end

  let!(:user) { FactoryGirl.create(:user) }

  it "renders the edit booking form" do
    render

    expect(rendered).to include('<h1>New booking</h1>')
    assert_select "form[action=?][method=?]", user_bookings_path(user_id: user.id), "post"

    assert_select "select[name=?]", "booking[check_in_date(1i)]"
    assert_select "select[name=?]", "booking[check_in_date(2i)]"
    assert_select "select[name=?]", "booking[check_in_date(3i)]"
    assert_select "select[name=?]", "booking[check_in_date(4i)]"
    assert_select "select[name=?]", "booking[check_in_date(5i)]"

    assert_select "select[name=?]", "booking[check_out_date(1i)]"
    assert_select "select[name=?]", "booking[check_out_date(2i)]"
    assert_select "select[name=?]", "booking[check_out_date(3i)]"
    assert_select "select[name=?]", "booking[check_out_date(4i)]"
    assert_select "select[name=?]", "booking[check_out_date(5i)]"

    assert_select "select[name=?]", "booking[hotel_id]"
    assert_select "select[name=?]", "booking[room_id]"
    assert_select "input[name=?]", "booking[stay_description]"
  end
end
