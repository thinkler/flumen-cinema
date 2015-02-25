class ActorsController < ApplicationController

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Actors", :actors_path

  before_action :if_admin, only: [:new, :edit, :destroy]

  def index
    @actors = Actor.order('name')
    @actors = @actors.paginate(:page => params[:page], :per_page => 16)
  end

  def show
    @actor = Actor.find(params[:id])
    @movies = @actor.movies
    add_breadcrumb "#{@actor.name}"
  end

  def new
    @actor = Actor.new
    add_breadcrumb "New actor"
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
    add_breadcrumb "Edit actor"
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
    movie_id = params[:id]
    @actor = Actor.find(params[:actor_id])
    @mov = movie_id
    @actor.movies << Movie.find(movie_id)
    redirect_to actor_path(@actor)
  end

  def delete_movie
    movie_id = params[:movie_id]
    @actor = Actor.find(params[:id])
    @actor.movies.delete(movie_id)
    redirect_to actor_path(params[:id])
  end

  def movie_select_list
    @movies = Movie.ransack(name_cont: params[:movie_name]).result
    @movies = @movies.limit(20)
  end


  private

  def actors_params
    params.require(:actor).permit(:name, :age, :photo_url, :about)
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
