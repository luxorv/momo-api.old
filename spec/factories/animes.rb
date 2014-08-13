# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :anime do
    name
    description
    association :director, factory: :person
    association :studio, factory: :studio
    association :network, factory: :network
    association :english_network, factory: :network
    episodes []
    films []
    licenses []
    start_run_date Date.today
    end_run_date Date.today
    #TODO episodes
    #TODO manga
    # episodes ""
    # manga ""
    association :manga, factory: :manga

    after(:create) { |anime| anime.episodes = create_list(:episode, 5)}
    after(:create) { |anime| anime.films = create_list(:entity, 5, entity_type: :Film)}
    after(:create) { |anime| anime.licenses = create_list(:producer, 5)}
  end
end
