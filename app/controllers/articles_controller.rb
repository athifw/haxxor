class ArticlesController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end 

  private

  def article_params
    params[:article].permit(:title, :url, :author)
  end
end
