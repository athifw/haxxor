class UpvotesController < ApplicationController
  before_action :require_login, only: [:create]

  def create
    @vote = parent.votes.for_user(current_user).first_or_initialize
    @vote.score = 1
    @vote.save
    redirect_to parent
  end

  private
  def parent
    @parent ||= Article.find(params[:article_id])
  end
end
