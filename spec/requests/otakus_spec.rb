require 'rails_helper'

RSpec.describe "Otakus", :type => :request do

  let(:valid_session) { {'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'} }

  describe "GET /otakus" do
    it "works! (now write some real specs)" do
      get otakus_path
      expect(response.status).to be(200)
    end
  end

  describe "POST create" do
    it "should assign new token to otaku" do
      email = "test@mongo#{Time.now.to_f}.com"
      password = "password"

      otaku = FactoryGirl.create(:otaku, :email => email, :password => password)
      data = {otaku: {:email => email, :password => password}}


      post '/otakus/bento', data.to_json, valid_session
      puts response.body
      expect(response.body).to include("Logged in")
      otaku.delete
    end
  end

  describe "DELETE destroy" do
    it "should change token to otaku" do
      email = "test@mongo#{Time.now.to_f}.com"
      password = "password"

      otaku = FactoryGirl.create(:otaku, :email => email, :password => password)
      data = {otaku: {:email => email, :password => password}}

      delete '/otakus/bento', data.to_json, valid_session
      puts response.body
      expect(response.body).to include("Logged out")
      otaku.delete
    end
  end

end
