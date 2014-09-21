require 'rails_helper'

RSpec.describe "Genres", :type => :request do
  describe "GET /genres" do
    it "should move to sign in" do
      get genres_path
      expect(response.status).to be(302)
    end
  end
end
