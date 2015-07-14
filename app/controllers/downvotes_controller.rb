class DownvotesController < ApplicationController
  before_action :require_login, only: [:create]

  def create
    @vote = parent.votes.for_user(current_user).first_or_initialize
    @vote.score = -1
    @vote.save
    redirect_to :back
  end

  private
  def parent
    @parent ||= if params[:article_id]
      Article.find(params[:article_id])
    else
      Comment.find(params[:comment_id])
    end
  end
end
