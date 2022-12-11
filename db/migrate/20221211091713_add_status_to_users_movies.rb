class AddStatusToUsersMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :users_movies, :status, :integer
  end
end
