require 'rails_helper'

RSpec.describe "Otakus", :type => :request do
  describe "GET /otakus" do
    it "works! (now write some real specs)" do
      get otakus_path
      expect(response.status).to be(200)
    end
  end
end
