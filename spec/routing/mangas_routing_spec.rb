require "rails_helper"

RSpec.describe MangasController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mangas").to route_to("mangas#index")
    end

    it "routes to #show" do
      expect(:get => "/mangas/1").to route_to("mangas#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/mangas").to route_to("mangas#create")
    end

    it "routes to #update" do
      expect(:put => "/mangas/1").to route_to("mangas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mangas/1").to route_to("mangas#destroy", :id => "1")
    end

  end
end
