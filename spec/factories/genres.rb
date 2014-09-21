# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:name) { |n| "Name #{n}" }
  sequence(:description) { |n| "Description #{n}" }

  factory :genre do
    name
    description
    after(:create) { |genre| genre.animes = build_list(:anime, 5)}
  end
end
