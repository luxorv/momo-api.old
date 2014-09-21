# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:industry) { |n| "Industry #{n}" }
  sequence(:website) { |n| "http://www.#{n}.com" }

  factory :studio do
    entity_type :studio
    name
    description
    industry
    website
    founded Date.today
  end
end
