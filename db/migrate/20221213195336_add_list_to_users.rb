class AddListToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :list, :string
  end
end
