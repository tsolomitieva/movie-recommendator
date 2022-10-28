class AddPlotToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :plot, :text
  end
end
