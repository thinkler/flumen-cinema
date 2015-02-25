class MoviesController < ApplicationController

  before_action :rating_check, only: [:up_vote, :down_vote]
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Movies", :movies_path

  before_action :if_admin, only: [:new, :edit, :destroy]

  def index
    @movies = Movie.all
    @movies = @movies.paginate(:page => params[:page], :per_page => 8)
  end

  def new
    @movie = Movie.new
    add_breadcrumb "New movie"
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_url
    end
  end

  def show
    @movie = Movie.find(params[:id])
    total_ball = @movie.calculate_ball
    @movie.total_ball = total_ball
    @actors = @movie.actors
    add_breadcrumb "#{@movie.name}"
  end

  def edit
    @movie = Movie.find(params[:id])
    add_breadcrumb "Edit movie"
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(params[:id])
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    if @movie.delete
      redirect_to movies_url
    end
  end

  def add_actor
    actor_id = params[:movie][:actor_id]
    @movie = Movie.find(params[:id])
    @movie.actors << Actor.find(actor_id)
    redirect_to movie_path(@movie)
  end

  def delete_actor
    actor_id = params[:actor_id]
    @movie = Movie.find(params[:id])
    @movie.actors.delete(actor_id)
    redirect_to movie_path(@movie)
  end

  def up_vote
    if @rating.movie_rating == "down"
      @rating.movie_rating = nil
      change_rating(@rating, "up")
      redirect_to(:back)
    elsif @rating.movie_rating == "up"
      redirect_to(:back)
    elsif  @rating.movie_rating.nil?
      @rating.movie_rating = "up"
      change_rating(@rating, "up")
      redirect_to(:back)
    end
  end

  def down_vote
    if @rating.movie_rating == "down"
      redirect_to(:back)
    elsif @rating.movie_rating == "up"
      @rating.movie_rating = nil
      change_rating(@rating, "down")
      redirect_to(:back)
    elsif  @rating.movie_rating.nil?
      @rating.movie_rating = "down"
      change_rating(@rating, "down")
      redirect_to(:back)
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :movie, :genre, :box_office, :poster_url, :desc, :rating)
  end

  def rating_check
    id = params[:id]
    if current_user.ratings.where(post_id: id).empty?
      @rating = current_user.ratings.create
      @rating.post_id = id
      @rating.save
    else
      @rating = current_user.ratings.find_by(post_id: id)
    end
  end

  def change_rating(rating, direction)
    rating.save
    movie = Movie.find(params[:id])
    if direction == "up"
      movie.rating += 1
    elsif direction == "down"
      movie.rating -= 1
    end
    movie.save
  end

  def if_admin
    if current_user
      if !current_user.admin?
        redirect_to root_path
      end  
    else
      redirect_to root_path
    end     
  end

end
