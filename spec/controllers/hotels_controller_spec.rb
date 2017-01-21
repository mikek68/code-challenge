require 'rails_helper'

describe HotelsController, type: :controller do
  login_user

  describe "GET #available_rooms" do
    let!(:hotel) { FactoryGirl.create(:hotel) }
    let!(:start_date) { DateTime.now - 1.day }
    let!(:end_date) { DateTime.now + 1.day }

    it "returns http success" do
      get :available_rooms, {id: hotel.id, start_date: start_date.to_s, end_date: end_date.to_s, format: :json}
      expect(response).to have_http_status(:success)
      expect(response.header['Content-Type']).to include('application/json')
    end
  end

end
