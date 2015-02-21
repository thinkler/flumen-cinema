class ChangeSublimeTable < ActiveRecord::Migration
  def change
    change_column :actors_movies, :actor_id, :integer, unique: true
    change_column :actors_movies, :movie_id, :integer, unique: true
  end
end
