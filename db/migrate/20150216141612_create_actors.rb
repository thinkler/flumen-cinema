class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.integer :age
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
