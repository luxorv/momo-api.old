require 'factory_girl_rails'

10.times do
  FactoryGirl.create :person
  FactoryGirl.create :studio
  FactoryGirl.create :network


  FactoryGirl.create :entity
  FactoryGirl.create :anime_rate

  FactoryGirl.create :genre
  FactoryGirl.create :manga
  FactoryGirl.create :anime
  FactoryGirl.create :episode

  FactoryGirl.create :otaku
end

FactoryGirl.create :otaku, :email => "test@mongo.com", :password => "password"

