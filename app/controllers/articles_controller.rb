class ArticlesController < ApplicationController

  # before_action :check_in, except: {:main, :show}

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to root_url
    end
  end

  private

  def check_in
    if current_user
      redirect_to new_user_session_path unless current_user.admin?
    else
      redirect_to new_user_session_path
    end
  end

  def article_params
    params.require(:article).permit(:title, :body, :img_url)
  end


end
