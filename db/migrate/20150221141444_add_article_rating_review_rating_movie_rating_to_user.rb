class AddArticleRatingReviewRatingMovieRatingToUser < ActiveRecord::Migration
  def change
    add_column :users, :art, :integer
  end
end
