require "rails_helper"

RSpec.describe AnimeRatesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/anime_rates").to route_to("anime_rates#index")
    end

    it "routes to #new" do
      expect(:get => "/anime_rates/new").to route_to("anime_rates#new")
    end

    it "routes to #show" do
      expect(:get => "/anime_rates/1").to route_to("anime_rates#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/anime_rates/1/edit").to route_to("anime_rates#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/anime_rates").to route_to("anime_rates#create")
    end

    it "routes to #update" do
      expect(:put => "/anime_rates/1").to route_to("anime_rates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/anime_rates/1").to route_to("anime_rates#destroy", :id => "1")
    end

  end
end
