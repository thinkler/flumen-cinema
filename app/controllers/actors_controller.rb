class ActorsController < ApplicationController

  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
    @movies = @actor.movies
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actors_params)
    if @actor.save
      redirect_to actors_url
    end
  end

  def edit
    @actor = Actor.find(params[:id])
  end

  def update
    @actor = Actor.find(params[:id])
    redirect_to actor_path(@actor) unless !@actor.update(actors_params)
  end

  def destroy
    @actor = Actor.find(params[:id])
    if @actor.delete
      redirect_ro actors_path
    end
  end

  def add_movie
    movie_id = params[:actor][:movie_id]
    @actor = Actor.find(params[:id])
    @actor.movies << Movie.find(movie_id)
    redirect_to actor_path(@actor)
  end

  def delete_movie
    movie_id = params[:movie_id]
    @actor = Actor.find(params[:id])
    @actor.movies.find(movie_id).delete
    redirect_to actors_path
  end


  private

  def actors_params
    params.require(:actor).permit(:name, :age, :photo_url, :about)
  end


end
