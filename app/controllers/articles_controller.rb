class ArticlesController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @articles = Article.order(created_at: :desc).limit(20)
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.build(article_params)
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
end
