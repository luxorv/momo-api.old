require "rails_helper"

RSpec.describe EntitiesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/entities").to route_to("entities#index")
    end

    it "routes to #show" do
      expect(:get => "/entities/1").to route_to("entities#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/entities").to route_to("entities#create")
    end

    it "routes to #update" do
      expect(:put => "/entities/1").to route_to("entities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/entities/1").to route_to("entities#destroy", :id => "1")
    end

  end
end
