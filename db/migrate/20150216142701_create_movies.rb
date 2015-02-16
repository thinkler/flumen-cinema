class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.float :box_office
      t.string :poster_url
      t.text :desc
      t.string :trailer_url
      t.integer :rating

      t.timestamps null: false
    end
  end
end
