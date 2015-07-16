FactoryGirl.define do
  factory :vote do
    user

    factory :upvote do
      score 1
    end

    factory :downvote do
      score -1
    end
  end

end
