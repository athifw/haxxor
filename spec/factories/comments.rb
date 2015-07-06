FactoryGirl.define do
  factory :comment do
    sequence(:text) { |n| "Comment #{n}" }
    user
    article
  end
end
