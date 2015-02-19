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

  end

  def edit
    @movie = Movie.find(params[:id])
  end
  
  private

  def movie_params
    params.require(:movie).permit(:name, :box_office, :poster_url, :desc, :rating)
  end


end
