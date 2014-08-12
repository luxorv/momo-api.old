require 'rails_helper'

RSpec.describe "Mangas", :type => :request do
  describe "GET /mangas" do
    it "works! (now write some real specs)" do
      get mangas_path
      expect(response.status).to be(200)
    end
  end
end
