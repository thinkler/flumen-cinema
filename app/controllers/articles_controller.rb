class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_url
    else
      render "new"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to root_url
    end
  end

  def main
    @articles = Article.all
  end


  private

  def article_params
    params.require(:article).permit(:title, :body, :img_url)
  end


end
