class RenameListToPuclicListUidInUsers < ActiveRecord::Migration[7.0]
  def change
     rename_column :users, :list, :public_list_uid
  end
end
