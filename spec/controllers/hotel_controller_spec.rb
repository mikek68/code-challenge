require 'rails_helper'

RSpec.describe HotelController, type: :controller do

  describe "GET #available_rooms" do
    it "returns http success" do
      get :available_rooms
      expect(response).to have_http_status(:success)
    end
  end

end
