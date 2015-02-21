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
    else
      render "new"
    end
  end

  def edit
    @actor = Actor.find(params[:id])
  end

  def update
    @actor = Actor.find(params[:id])
    if @actor.update(actors_params)
      redirect_to actor_path(@actor)
    else
      rende "edit"
    end
  end

  def destroy
    @actor = Actor.find(params[:id])
    if @actor.delete
      redirect_to actors_path
    end
  end

  def add_movie
    movie_id = params[:actor][:movie_id]
    @actor = Actor.find(params[:id])

    @mov = movie_id

    #
    # @actor.movies.each do |m|
    #   if m.id == movie_id
    #     redirect_to actor_path(@actor)
    #   end
    # end

    @actor.movies << Movie.find(movie_id)
    redirect_to actor_path(@actor)
  end

  def delete_movie
    movie_id = params[:movie_id]
    @actor = Actor.find(params[:id])
    @actor.movies.delete(movie_id)
    redirect_to actor_path(params[:id])
  end


  private

  def actors_params
    params.require(:actor).permit(:name, :age, :photo_url, :about)
  end


end
