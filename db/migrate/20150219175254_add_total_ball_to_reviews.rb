class AddTotalBallToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :total_ball, :integer
  end
end
