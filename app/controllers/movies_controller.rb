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
  
  private

  def movie_params
    params.require(:movie).permit(:name, :movie, :genre, :box_office, :poster_url, :desc, :rating)
  end


end
