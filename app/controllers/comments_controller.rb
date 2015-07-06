class CommentsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @comments = article.comments
  end

  def new
    @comment = article.comments.build
  end

  def create
    @comment = article.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to article
    else
      render :new
    end
  end

  private
  def comment_params
    params[:comment].permit(:text)
  end

  def article
    @article ||= Article.find(params[:article_id])
  end
  helper_method :article
end
