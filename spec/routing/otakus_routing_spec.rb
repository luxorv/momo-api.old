require "rails_helper"

RSpec.describe OtakusController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/otakus").to route_to("otakus#index")
    end

    it "routes to #show" do
      expect(:get => "/otakus/1").to route_to("otakus#show", :id => "1")
    end

  end
end
