FactoryGirl.define do
  factory :article do
    sequence(:title) { |n| "Test Title #{n}" }
    url "https://facebook.com"
    author "Me"
    published_at { Time.now }
  end
end