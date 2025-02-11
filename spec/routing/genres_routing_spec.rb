require "rails_helper"

RSpec.describe GenresController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/genres").to route_to("genres#index")
    end

    it "routes to #show" do
      expect(:get => "/genres/1").to route_to("genres#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/genres").to route_to("genres#create")
    end

    it "routes to #update" do
      expect(:put => "/genres/1").to route_to("genres#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/genres/1").to route_to("genres#destroy", :id => "1")
    end

  end
end
