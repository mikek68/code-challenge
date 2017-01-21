require "rails_helper"

describe BookingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/users/1/bookings").to route_to("bookings#index", user_id: "1")
      expect(:get => "/users/1/bookings.json").to route_to("bookings#index", user_id: "1", format: "json")
    end

    it "routes to #new" do
      expect(:get => "/users/1/bookings/new").to route_to("bookings#new", user_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/bookings/1").to route_to("bookings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/bookings/1/edit").to route_to("bookings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/users/1/bookings").to route_to("bookings#create", user_id: "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/bookings/1").to route_to("bookings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/bookings/1").to route_to("bookings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/bookings/1").to route_to("bookings#destroy", :id => "1")
    end

  end
end
