# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:number) {|x| x}
  sequence(:synopsis) {|x| "This Episode Synopsis #{x}"}

  factory :episode do
    name
    number
    type "NAE"
    synopsis
    length Time.now
    urls %w(www.1.com www.2.com)
    release_date Date.today
    season 1
    popularity 1.35

  end
end
