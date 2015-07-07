class CommentsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @comments = parent.comments
  end

  def new
    @comment = parent.comments.build
  end

  def create
    @comment = parent.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @comment.article
    else
      render :new
    end
  end

  private
  def comment_params
    params[:comment].permit(:text)
  end

  def parent
    @parent ||= if params[:article_id]
      Article.find(params[:article_id])
    else
      Comment.find(params[:comment_id])
    end
  end
  helper_method :parent
end
