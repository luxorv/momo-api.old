require 'rails_helper'

RSpec.describe "Episodes", :type => :request do
  describe "GET /episodes" do
    it "works! (now write some real specs)" do
      get episodes_path
      expect(response.status).to be(200)
    end
  end
end
