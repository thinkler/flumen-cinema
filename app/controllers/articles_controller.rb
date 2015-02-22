class ArticlesController < ApplicationController

  before_action :check_in, except: [:up_vote, :down_vote, :main, :show]
  before_action :rating_check, only: [:up_vote, :down_vote]

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

  def up_vote
    if @rating.article_rating == "down"
      @rating.article_rating = nil
      change_rating(@rating, "up")
      redirect_to(:back)
    elsif @rating.article_rating == "up"
      redirect_to(:back)
    elsif  @rating.article_rating.nil?
      @rating.article_rating = "up"
      change_rating(@rating, "up")
      redirect_to(:back)
    end
  end

  def down_vote
    if @rating.article_rating == "down"
      redirect_to(:back)
    elsif @rating.article_rating == "up"
      @rating.article_rating = nil
      change_rating(@rating, "down")
      redirect_to(:back)
    elsif  @rating.article_rating.nil?
      @rating.article_rating = "down"
      change_rating(@rating, "down")
      redirect_to(:back)
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

  def change_rating(rating, direction)
    rating.save
    article = Article.find(params[:id])

    if direction == "up"
      article.rating += 1
    elsif direction == "down"
      article.rating -= 1
    end
    article.save
  end

  def rating_check
    id = params[:id]
    if current_user.ratings.where(post_id: id).empty?
      @rating = current_user.ratings.create(post_id: id)
      @rating.post_id = id
      @rating.save
    else
      @rating = current_user.ratings.find_by(post_id: id)
    end
  end

end
