# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:name) { |n| "Genre #{n}" }
  sequence(:description) { |n| "Description #{n}" }

  factory :genre do
    name
    description
  end
end
