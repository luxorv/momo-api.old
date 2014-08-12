# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :manga do
    name
    description
    association :writer, factory: :person
    association :publisher, factory: :entity, entity_type: :publisher
    association :english_publisher, factory: :entity, entity_type: :publisher
    association :magazine, factory: :entity, entity_type: :magazine
    start_run_date Date.today
    end_run_date Date.today
    volumes 15
  end
end
