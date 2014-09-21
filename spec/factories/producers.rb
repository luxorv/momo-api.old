# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :producer do
    name
    description
    type "Type Of Product"
    website
  end
end
