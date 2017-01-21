require 'rails_helper'

describe "Bookings", type: :request do
  before(:each) do
    sign_in FactoryGirl.create(:user)
  end

  describe "GET /users/:id/bookings" do
    it "an html request redirects to root url" do
      get user_bookings_path(user_id: 1)
      expect(response).to redirect_to(root_path)
      expect(response).to have_http_status(302)
      follow_redirect!

      expect(response).to render_template(:index)
      expect(response.body).to include("Bookings Dashboard")
    end

    it "a json request return a JSON object" do
      hotel = FactoryGirl.create(:hotel)
      room = FactoryGirl.create(:room, hotel_id: hotel.id)
      booking = FactoryGirl.create(:booking,
                                    hotel_id: hotel.id,
                                    room_id: room.id,
                                    user_id: 1,
                                    check_in_date: DateTime.now,
                                    check_out_date: DateTime.now + 5.days
                                    )
      start_date = booking.check_in_date.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      end_date = booking.check_out_date.strftime('%Y-%m-%dT%H:%M:%S.%LZ')
      title = "#{hotel.name} - Room #{room.room_number} (#{room.room_type.name})"
      booking_item = {"id"=>booking.id, "title"=>title, "start"=>start_date, "end"=>end_date, "url"=>"/bookings/#{booking.id}"}

      get user_bookings_path(user_id: 1, start: (DateTime.now - 1.day).to_s, end: (DateTime.now + 2.days).to_s, format: :json)
      expect(response.header['Content-Type']).to include('application/json')
      expect(JSON.parse(response.body)).to eq([booking_item])
    end
  end

  describe "Get /booking/:id" do
    it "shows a booking" do
      hotel = FactoryGirl.create(:hotel)
      room = FactoryGirl.create(:room, hotel_id: hotel.id)
      booking = FactoryGirl.create(:booking,
                                    hotel_id: hotel.id,
                                    room_id: room.id,
                                    user_id: 1,
                                    check_in_date: DateTime.now,
                                    check_out_date: DateTime.now + 5.days
                                    )
      get booking_path(id: booking.id)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  describe "Get /users/:user_id/bookings/new" do
    it "displays the New Booking form" do
      user = FactoryGirl.create(:user, email: 'test2@test.com')

      get new_user_booking_path(user_id: user.id)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe 'Post /users/:user_id/bookings' do
    it "creates a booking" do
      booking_attribs = {
        booking: {
          "user_id" => 1,
          "hotel_id" => 1,
          "room_id" => 1,
          "check_in_date(1i)" => "2017",
          "check_in_date(2i)" => "1",
          "check_in_date(3i)" => "23",
          "check_in_date(4i)" => "12",
          "check_in_date(5i)" => "26",
          "check_out_date(1i)" => "2017",
          "check_out_date(2i)" => "1",
          "check_out_date(3i)" => "25",
          "check_out_date(4i)" => "12",
          "check_out_date(5i)" => "26",
          "stay_description" => 'Test'
        }
      }
      post user_bookings_path( user_id: 1, params: booking_attribs )
      expect(Booking.count).to eq(1)
      expect(response).to redirect_to(booking_path(id: Booking.first.id))
    end

    it "shows a booking error" do
      booking_attribs = {
        booking: {
          "user_id" => 1,
          "hotel_id" => 1,
          "room_id" => '',
          "check_in_date(1i)" => "2017",
          "check_in_date(2i)" => "1",
          "check_in_date(3i)" => "23",
          "check_in_date(4i)" => "12",
          "check_in_date(5i)" => "26",
          "check_out_date(1i)" => "2017",
          "check_out_date(2i)" => "1",
          "check_out_date(3i)" => "25",
          "check_out_date(4i)" => "12",
          "check_out_date(5i)" => "26",
          "stay_description" => 'Test'
        }
      }
      post user_bookings_path( user_id: 1, params: booking_attribs )
      expect(Booking.count).to eq(0)
      expect(response).to render_template(:new)
      expect(response.body).to include("1 error prohibited this booking from being saved")
      expect(response.body).to include("Room can&#39;t be blank")
    end
  end

  describe "Put /bookings/:id" do
    it "updates a booking" do
      booking = FactoryGirl.create(:booking, stay_description: 'No Description')
      booking_attribs = {
        booking: {
          "user_id" => 1,
          "hotel_id" => 1,
          "room_id" => 1,
          "check_in_date(1i)" => "2017",
          "check_in_date(2i)" => "1",
          "check_in_date(3i)" => "23",
          "check_in_date(4i)" => "12",
          "check_in_date(5i)" => "26",
          "check_out_date(1i)" => "2017",
          "check_out_date(2i)" => "1",
          "check_out_date(3i)" => "25",
          "check_out_date(4i)" => "12",
          "check_out_date(5i)" => "26",
          "stay_description" => 'Test Description'
        }
      }

      put booking_path( id: booking.id, params: booking_attribs )
      booking.reload
      expect(booking.stay_description).to eq('Test Description')
      expect(response).to redirect_to(booking_path(id: booking.id))
    end
  end

  describe "Delete /booking/:id" do
    it "deletes a booking" do
      booking = FactoryGirl.create(:booking)

      delete booking_path(id: booking.id)
      expect(Booking.count).to eq(0)
      expect(response).to redirect_to(root_path)

    end
  end
end
