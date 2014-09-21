# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:lastname) { |n| "Lastname #{n}" }
  sequence(:age) { |n| n+15 }

  factory :person do
    name
    lastname
    age
  end
end
