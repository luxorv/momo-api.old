require "rails_helper"

RSpec.describe NetworksController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/networks").to route_to("networks#index")
    end

    it "routes to #show" do
      expect(:get => "/networks/1").to route_to("networks#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/networks").to route_to("networks#create")
    end

    it "routes to #update" do
      expect(:put => "/networks/1").to route_to("networks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/networks/1").to route_to("networks#destroy", :id => "1")
    end

  end
end
