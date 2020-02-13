class AddReleaseDateToFilms < ActiveRecord::Migration[5.2]
  def change
  	add_column :films,:release_date,:datetime
  end
end
