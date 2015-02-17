class AddDefaultRatingToSomeTables < ActiveRecord::Migration
  def change
    change_column :articles, :rating, :integer, :default => 0
    change_column :movies, :rating, :integer, :default => 0
    change_column :reviews, :rating, :integer, :default => 0
  end
end
