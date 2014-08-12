# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :anime do
    name
    description
    association :director, factory: :person
    association :studio, factory: :studio
    association :network, factory: :network
    association :english_network, factory: :network
    start_run_date Date.today
    end_run_date Date.today
    #TODO episodes
    #TODO manga
    # episodes ""
    # manga ""
    association :manga, factory: :manga
  end
end
