require "rails_helper"

describe HotelsController, type: :routing do
  describe "routing" do

    it "routes to #available_rooms" do
      expect(:get => "/hotels/1/available_rooms.json").to route_to("hotels#available_rooms", id: "1", format: "json")
    end

    it "routes to #index" do
      expect(:get => "/hotels").to_not route_to("hotels#index")
    end

    it "routes to #new" do
      expect(:get => "/hotels/new").to_not route_to("hotels#new")
    end

    it "routes to #show" do
      expect(:get => "/hotels/1").to_not route_to("hotels#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hotels/1/edit").to_not route_to("hotels#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hotels").to_not route_to("hotels#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/hotels/1").to_not route_to("hotels#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/hotels/1").to_not route_to("hotels#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hotels/1").to_not route_to("hotels#destroy", :id => "1")
    end

  end
end
