class AddRatingToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :rating, :decimal
  end
end
