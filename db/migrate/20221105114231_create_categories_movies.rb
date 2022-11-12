class CreateCategoriesMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_movies do |t|
      t.integer :movie_id
      t.integer :category_id

      t.timestamps
    end
  end
end
