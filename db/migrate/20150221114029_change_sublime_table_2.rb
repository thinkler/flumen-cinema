class ChangeSublimeTable2 < ActiveRecord::Migration
  def change
    remove_column :actors_movies, :actor_id
    remove_column :actors_movies, :movie_id
  end
end
