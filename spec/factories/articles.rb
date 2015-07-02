FactoryGirl.define do
  factory :article do
    sequence(:title) { |n| "Test Title #{n}" }
    url "https://facebook.com"
    user
  end
end