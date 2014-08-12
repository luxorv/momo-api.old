require "rails_helper"

RSpec.describe StudiosController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/studios").to route_to("studios#index")
    end

    it "routes to #show" do
      expect(:get => "/studios/1").to route_to("studios#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/studios").to route_to("studios#create")
    end

    it "routes to #update" do
      expect(:put => "/studios/1").to route_to("studios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/studios/1").to route_to("studios#destroy", :id => "1")
    end

  end
end
