class RemovePosterFromMovie < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :poster, :string
  end
end
