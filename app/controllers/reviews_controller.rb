class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
    if @reviews.save
      redirect_to reviews_path
    end
  end

  def edit
    @review = Review.find(params[:id])
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

  private

  def reviews_params
    params.require(:review).permit(:title, :body, :total_ball)
  end

end
