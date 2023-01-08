module UsersHelper
  def friend_button(user)
    if current_user.friends.where(id: user.id).exists?
      button_to 'Delete Friend', delete_friend_path(friend_id: user.id), method: :delete, class: 'btn btn-danger mt-2'
    else
      button_to 'Add Friend', add_friend_path(friend_id: user.id), method: :post, class: 'btn btn-primary mt-2'
    end
  end
end
