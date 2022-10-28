class RemoveFieldNameFromMovie < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :IMDB_rating, :decimal
  end
end
