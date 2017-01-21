require 'rails_helper'

describe "Users", type: :request do
  before(:each) do
    sign_in FactoryGirl.create(:user)
  end

  describe "GET /users" do
    it "shows the bookings dashboard" do
      get users_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end
end
