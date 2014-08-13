# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:email) { |x| "email#{x}@momo.com" }
  sequence(:ip_address) { |x| "192.168.1.#{x}" }

  factory :otaku do
    ## Database authenticatable
    email
    # encrypted_password

    ## Recoverable
    # reset_password_token
    # reset_password_sent_at

    ## Rememberable
    # remember_created_at

    ## Trackable
    sign_in_count 1
    current_sign_in_at Time.now
    last_sign_in_at Time.now
    current_sign_in_ip ip_address
    last_sign_in_ip ip_address
  end
end
