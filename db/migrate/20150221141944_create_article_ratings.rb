class CreateArticleRatings < ActiveRecord::Migration
  def change
    create_table :article_ratings do |t|

      t.timestamps null: false
    end
  end
end
