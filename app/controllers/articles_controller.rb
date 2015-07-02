class ArticlesController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @articles = Article.order(created_at: :desc).limit(20)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end 

  private

  def article_params
    params[:article].permit(:title, :url)
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to articles_path # halts request cycle
    end
  end
end
