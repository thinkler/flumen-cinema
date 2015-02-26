class ActorsController < ApplicationController

  include AdminModule
  before_action :if_admin, except: [:up_vote, :down_vote, :index, :show]


  add_breadcrumb "Home", :root_path
  add_breadcrumb "Actors", :actors_path

  def index
    @actors = Actor.order('name')
    @q = @actors.ransack(params[:q])
    @q.build_condition
    if params[:q]
      @actors = @q.result
    end  
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
      flash[:success] = "Actor created"
      redirect_to actors_url
    else
      flash[:error] = "Input error"
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
      flash[:error] = "Input error"
      render "edit"
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

  def movie_list
    @movies = Actor.find(params[:id]).movies
    @movies = @movies.paginate(:page => params[:page], :per_page => 15)
  end

  private

  def actors_params
    params.require(:actor).permit(:name, :age, :photo_url, :about)
  end

end
