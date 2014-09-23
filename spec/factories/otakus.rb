# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:email) { |x| "email#{x}_#{Time.now.to_f}@momo.com".sub(" ","") }
  sequence(:current_sign_in_ip) { |x| "192.168.1.#{x}" }
  sequence(:last_sign_in_ip) { |x| "192.168.0.#{x}" }
  sequence(:password) { |x| "WeLoveMomo#{x}" }

  factory :otaku do
    name
    email
    password
    role :otaku

    sign_in_count 1
    current_sign_in_at Time.now
    last_sign_in_at Time.now

    current_sign_in_ip
    last_sign_in_ip

    # encrypted_password

    ## Recoverable
    # reset_password_token
    # reset_password_sent_at

    ## Rememberable
    # remember_created_at

    ## Trackable

    watch_list []
    watching_list []
    watched_list []

    after(:create) { |otaku| otaku.watch_list = create_list(:anime, 2)}
    after(:create) { |otaku| otaku.watching_list = build_list(:anime, 1)}
    after(:create) { |otaku| otaku.watched_list = build_list(:anime, 1)}
  end
end
