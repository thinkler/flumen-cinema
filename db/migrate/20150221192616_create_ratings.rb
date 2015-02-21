class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|

      t.string :article_rating
      t.string :movie_rating
      t.string :review_rating

      t.timestamps null: false
    end
  end
end
