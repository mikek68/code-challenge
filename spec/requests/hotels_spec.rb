require 'rails_helper'

describe "Hotels", type: :request do
  before(:each) do
    sign_in FactoryGirl.create(:user)
  end

  let!(:hotel) { FactoryGirl.create(:hotel) }
  let!(:start_date) { DateTime.now - 1.day }
  let!(:end_date) { DateTime.now + 1.day }

  describe "GET /available_rooms" do
    it "returns available_rooms" do
      get hotel_available_rooms_path(id: hotel.id, start_date: start_date.to_s, end_date: end_date.to_s, format: :json)
      expect(response).to have_http_status(:success)
      expect(response.header['Content-Type']).to include('application/json')
    end
  end
end
