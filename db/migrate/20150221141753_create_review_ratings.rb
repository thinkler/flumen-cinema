class CreateReviewRatings < ActiveRecord::Migration
  def change
    create_table :review_ratings do |t|

      t.timestamps null: false
    end
  end
end
