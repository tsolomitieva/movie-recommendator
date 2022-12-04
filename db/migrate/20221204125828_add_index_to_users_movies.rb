class AddIndexToUsersMovies < ActiveRecord::Migration[7.0]
  def change
    add_index :users_movies, [:user_id, :movie_id], unique: true
  end
end
