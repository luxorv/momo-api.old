require "rails_helper"

RSpec.describe AnimesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/animes").to route_to("animes#index")
    end

    it "routes to #show" do
      expect(:get => "/animes/1").to route_to("animes#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/animes").to route_to("animes#create")
    end

    it "routes to #update" do
      expect(:put => "/animes/1").to route_to("animes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/animes/1").to route_to("animes#destroy", :id => "1")
    end

  end
end
