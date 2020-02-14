class AddCastToFilms < ActiveRecord::Migration[5.2]
  def change
  	add_column :films,:cast,:text
  	add_column :films,:director,:string
  	

  end
end
