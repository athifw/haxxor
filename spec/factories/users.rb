FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "Username #{n}" }
    sequence(:email) { |n| "MyEmail#{n}@test.com" }
    password "password"
    password_confirmation "password"
  end
end