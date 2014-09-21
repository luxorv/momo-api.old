# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :network do
    name
    description
    region "America"
  end
end
