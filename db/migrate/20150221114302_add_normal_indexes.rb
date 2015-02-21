class AddNormalIndexes < ActiveRecord::Migration
  def change
    add_column :actors_movies, :actor_id, :integer, :unique => true
    add_column :actors_movies, :movie_id, :integer, :unique => true
  end
end
