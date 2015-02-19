class AddAboutToActors < ActiveRecord::Migration
  def change
    add_column :actors, :about, :text
  end
end
