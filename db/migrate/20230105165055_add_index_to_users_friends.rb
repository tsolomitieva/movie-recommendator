class AddIndexToUsersFriends < ActiveRecord::Migration[7.0]
  def change
    add_index :users_friends, %i[user_id friend_id], unique: true
  end
end
