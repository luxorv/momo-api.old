require 'rails_helper'

RSpec.describe "Producers", :type => :request do
  describe "GET /producers" do
    it "works! (now write some real specs)" do
      get producers_path
      expect(response.status).to be(200)
    end
  end
end
