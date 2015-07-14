module VotesHelper
  def upvote_link(parent, user)
    vote = parent.vote_by(user)
    if vote && vote.upvote?
      'Upvoted'
    else
      link_to 'Upvote', [parent, :upvote], method: :post
    end
  end

  def downvote_link(parent, user)
    vote = parent.vote_by(user)
    if vote && vote.downvote?
      'Downvoted'
    else
      link_to 'Downvote', [parent, :downvote], method: :post
    end
  end
end
