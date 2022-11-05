class AddIndexToCategoriesMovies < ActiveRecord::Migration[7.0]
  def change
    add_index :categories_movies, [:movie_id, :category_id], unique: true
  end
end
