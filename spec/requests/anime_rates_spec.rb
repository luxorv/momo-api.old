require 'rails_helper'

RSpec.describe "AnimeRates", :type => :request do
  describe "GET /anime_rates" do
    it "works! (now write some real specs)" do
      get anime_rates_path
      expect(response.status).to be(200)
    end
  end
end
