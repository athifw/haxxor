module Voteable
  def self.included(base)
    base.has_many :votes, as: :voteable
  end

  def vote_by(user)
    votes.for_user(user).first
  end
  
  def score
    votes.sum(:score)
  end
end