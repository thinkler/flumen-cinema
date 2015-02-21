class CreateMovieRatings < ActiveRecord::Migration
  def change
    create_table :movie_ratings do |t|

      t.timestamps null: false
    end
  end
end
