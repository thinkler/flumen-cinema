class ReviewsController < ApplicationController

  before_action :rating_check, only: [:up_vote, :down_vote]
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Reviews", :reviews_path

  include AdminModule
  before_action :if_admin, except: [:up_vote, :down_vote, :index, :show, :new, :create]

  def index
    @reviews = Review.all
    @reviews = @reviews.paginate(:page => params[:page], :per_page => 4)
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
    @comments = @review.comments.paginate(:page => params[:page], :per_page => 10)
    add_breadcrumb "#{@review.title}"
  end

  def new
    @review = Review.new
    add_breadcrumb "New review"
  end

  def create
    if current_user.reviews.where(movie_id: params[:review][:movie_id]).empty?
      review = Review.new(reviews_params)
      if review.save
        redirect_to reviews_path
      else
        redirect_to reviews_path
      end
    else
      redirect_to reviews_path
    end
  end

  def edit
    @review = Review.find(params[:id])
    add_breadcrumb "Edit review"
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(reviews_params)
      redirect_to review_path(@review)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to reviews_path
    end
  end

  def up_vote
    if @rating.review_rating == "down"
      @rating.review_rating  = nil
      change_rating(@rating, "up")
      redirect_to(:back)
    elsif @rating.review_rating == "up"
      redirect_to(:back)
    elsif  @rating.review_rating.nil?
      @rating.review_rating  = "up"
      change_rating(@rating, "up")
      redirect_to(:back)
   end
  end

  def down_vote
    if @rating.review_rating == "down"
      redirect_to(:back)
    elsif @rating.review_rating == "up"
      @rating.review_rating = nil
      change_rating(@rating, "down")
      redirect_to(:back)
    elsif  @rating.review_rating.nil?
      @rating.review_rating = "down"
      change_rating(@rating, "down")
      redirect_to(:back)
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:title, :body, :total_ball, :user_id, :movie_id)
  end

  def change_rating(rating, direction)
    rating.save
    review = Review.find(params[:id])

    if direction == "up"
      review.rating += 1
    elsif direction == "down"
      review.rating -= 1
    end
    review.save
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
