FactoryGirl.define do
  factory :comment do
    sequence(:text) { |n| "Comment #{n}" }
    user
    association :commentable, factory: :article, strategy: :build
  end
end
