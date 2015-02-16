class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :rating

      t.integer :article_id
      t.integer :review_id
      t.integer :movie_id

      t.timestamps null: false
    end
  end
end
