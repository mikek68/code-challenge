require "rails_helper"

describe HotelsController, type: :routing do
  describe "routing" do

    it "routes to #available_rooms" do
      expect(:get => "/hotels/1/available_rooms.json").to route_to("hotels#available_rooms", id: "1", format: "json")
    end

  end
end
