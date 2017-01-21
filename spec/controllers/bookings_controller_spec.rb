require 'rails_helper'

describe BookingsController, type: :controller do
  login_user

  let!(:user) { FactoryGirl.create(:user, email: 'test1@test.com') }

  describe "GET #index" do
    let!(:start_date) { DateTime.now - 1.day }
    let!(:end_date) { DateTime.now + 1.day }

    it "returns http success and JSON response" do
      get :index, {user_id: user.id, start: start_date.to_s, end: end_date.to_s, format: :json}
      expect(response).to have_http_status(:success)
      expect(response.header['Content-Type']).to include('application/json')
    end

    it "redirects to root_path" do
      get :index, {user_id: user.id}
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET #show" do
   it "assigns the requested booking as @booking" do
      booking = FactoryGirl.create(:booking)
      get :show, {id: booking.to_param}
      expect(assigns(:booking)).to eq(booking)
    end
  end

  describe "GET #new" do
   it "assigns a new booking as @booking" do
      get :new, {user_id: user.id}
      expect(assigns(:booking)).to be_a_new(Booking)
    end
  end

  describe "GET #edit" do
    it "assigns the requested booking as @booking" do
      booking = FactoryGirl.create(:booking)
      get :edit, {id: booking.to_param}
      expect(assigns(:booking)).to eq(booking)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      booking_attribs = {
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

      it "creates a new Booking" do
        expect {
          post :create, {user_id: user.id, booking: booking_attribs}
        }.to change(Booking, :count).by(1)
      end

      it "assigns a newly created booking as @booking" do
        post :create, {user_id: user.id, booking: booking_attribs}
        expect(assigns(:booking)).to be_a(Booking)
        expect(assigns(:booking)).to be_persisted
      end

      it "redirects to the created booking" do
        post :create, {user_id: user.id, booking: booking_attribs}
        expect(response).to redirect_to(Booking.last)
      end
    end

    context "with invalid params" do
      booking_attribs = {
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

      it "assigns a newly created but unsaved booking as @booking" do
        post :create, {user_id: user.id, booking: booking_attribs}
        expect(assigns(:booking)).to be_a_new(Booking)
      end

      it "re-renders the 'new' template" do
        post :create, {user_id: user.id, booking: booking_attribs}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      booking_attribs = {
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

      it "updates the requested booking" do
        booking = FactoryGirl.create(:booking, stay_description: 'No Description')
        put :update, {id: booking.id, booking: booking_attribs}
        booking.reload
        expect(booking.stay_description).to eq('Test Description')
      end

      it "assigns the requested booking as @booking" do
        booking = FactoryGirl.create(:booking, stay_description: 'No Description')
        put :update, {id: booking.id, booking: booking_attribs}
        expect(assigns(:booking)).to eq(booking)
      end

      it "redirects to the booking" do
        booking = FactoryGirl.create(:booking, stay_description: 'No Description')
        put :update, {id: booking.id, booking: booking_attribs}
        expect(response).to redirect_to(booking)
      end
    end

    context "with invalid params" do
      booking_attribs = {
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
          "stay_description" => 'Test Description'
        }

      it "assigns the booking as @booking" do
        booking = FactoryGirl.create(:booking, stay_description: 'No Description')
        put :update, {id: booking.id, booking: booking_attribs}
        expect(assigns(:booking)).to eq(booking)
      end

      it "re-renders the 'edit' template" do
        booking = FactoryGirl.create(:booking, stay_description: 'No Description')
        put :update, {id: booking.id, booking: booking_attribs}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested booking" do
      booking = FactoryGirl.create(:booking)
      expect {
        delete :destroy, {id: booking.to_param}
      }.to change(Booking, :count).by(-1)
    end

    it "redirects to the root_path" do
      booking = FactoryGirl.create(:booking)
      delete :destroy, {id: booking.to_param}
      expect(response).to redirect_to(root_path)
    end
  end

end
