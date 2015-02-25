class AddUserBallToMovie < ActiveRecord::Migration
  def change
  	add_column :movies, :total_ball, :integer, default: 0
  end
end
