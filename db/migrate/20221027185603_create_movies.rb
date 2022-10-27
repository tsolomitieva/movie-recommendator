class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :poster
      t.string :title
      t.string :plot
      t.decimal :IMDB_rating
      t.integer :year

      t.timestamps
    end
  end
end
