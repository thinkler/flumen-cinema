class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_url
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
  end

  def edit
    @movie = Movie.find(params[:id])
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

  private

  def movie_params
    params.require(:movie).permit(:name, :movie, :genre, :box_office, :poster_url, :desc, :rating)
  end


end
