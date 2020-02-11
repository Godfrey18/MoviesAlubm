class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
    	t.string :name
    	t.string :genere
    	t.string :langauge
    	t.timestamps
    end
  end
end
