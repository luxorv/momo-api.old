# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entity do
    name
    description
    entity_type "Entity"
  end
end
