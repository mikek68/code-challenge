require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
  login_user

  describe "GET #new" do
    it "redirects when Booking ID is not supplied" do
      get :new
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end

    it "returns http success" do
      hotel = FactoryGirl.create(:hotel)
      room = FactoryGirl.create(:room, hotel_id: hotel.id)

      booking = FactoryGirl.create(:booking,
                                    hotel_id: hotel.id,
                                    room_id: room.id,
                                    user_id: 1,
                                    check_in_date: DateTime.now,
                                    check_out_date: DateTime.now + 5.days
                                    )

      get :new, {booking_id: booking.id}
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe "GET #create" do
    it "returns http redirect with error" do
      hotel = FactoryGirl.create(:hotel)
      room = FactoryGirl.create(:room, hotel_id: hotel.id)

      booking = FactoryGirl.create(:booking,
                                    hotel_id: hotel.id,
                                    room_id: room.id,
                                    user_id: 1,
                                    check_in_date: DateTime.now,
                                    check_out_date: DateTime.now + 5.days
                                    )

      get :create, nil, {booking_id: booking.id}
      expect(response).to have_http_status(302)
      expect(flash[:error]).to eq('Cannot charge a customer that has no active card')
      expect(response).to redirect_to(new_charge_path(booking_id: booking.id))
    end
  end

end
