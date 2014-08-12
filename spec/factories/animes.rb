# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :anime do
    name
    director ""
    studio ""
    network ""
    english_network ""
    start_run_date ""
    end_run_date ""
    episodes ""
    manga ""
  end
end
