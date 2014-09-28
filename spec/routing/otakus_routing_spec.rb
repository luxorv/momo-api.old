require "rails_helper"

RSpec.describe OtakusController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/otakus").to route_to("otakus#index")
    end

    it "routes to #show" do
      expect(:get => "/otakus/1").to route_to("otakus#show", :id => "1")
    end

    it "routes to lists" do
      expect(:get => "/otakus/1/add/watch").to route_to("otakus#add_to_watch_list", :id => "1")
      expect(:get => "/otakus/1/add/watched").to route_to("otakus#add_to_watched_list", :id => "1")
      expect(:get => "/otakus/1/add/watching").to route_to("otakus#add_to_watching_list", :id => "1")
    end

  end
end
