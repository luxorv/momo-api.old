# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:value) {|x| x=(rand*100%10).round}

  factory :anime_rate do
    # anime_id "MyString"
    # otaku_id "MyString"
    value
    association :anime, factory: :anime
    association :otaku, factory: :otaku

  end
end
