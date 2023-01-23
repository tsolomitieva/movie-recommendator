class UsersController < ApplicationController
  def movie_list
    @user = User.find_by(public_list_uid: params[:public_list_uid])
    if @user
      # get movies with want_to_see status from the given list url
      @movies_list = Movie.joins(:users_movies).where(users_movies: { user: @user })
      @movies = @movies_list.includes(:categories, :users_movies, poster_attachment: :blob).page params[:page]
      if current_user == @user
        # @recommended_movies = Movie.select{ |m| !UsersMovie.exists?(movie: m,user: current_user)}.sample(3)
        movie_ids = @user.movies.pluck(:id)
        @recommended_movies = Movie.where.not(id: movie_ids).sample(3)
        redirect_to movies_path, notice: 'You have evaluate all movies' if @recommended_movies.blank?
      end
    else
      redirect_to movies_path, notice: "User wasn't found"
    end
  end

  # search user
  def search_user
    @q = User.ransack(params[:q])
    # if user hasn't search yet
    return unless params[:q].present?

    @users = @q.result
  end

  # add friend
  def add_friend
    if params[:friend_id] != current_user.id
      @friend = UsersFriend.new(user_id: current_user.id, friend_id: params[:friend_id])

      if @friend.save
        redirect_to search_user_users_path, notice: 'Friend was added.'
      else
        redirect_to search_user_users_path, notice: 'Error in adding friend.'
      end
    else
      redirect_to search_user_users_path, notice: 'Error in adding friend.'
    end
  end

  # delete friend
  def delete_friend
    @friend = current_user.users_friends.find_by(friend_id: params[:friend_id])
    if @friend.destroy
      redirect_to search_user_users_path, notice: 'Friend was deleted.'
    else
      redirect_to search_user_users_path, notice: 'Error in deleting friend.'
    end
  end

  def match; end

  def match_lists
    users_movies = Movie.joins(:users_movies).where(users_movies: { user: current_user, status: 0 })
    friend_movies = Movie.joins(:users_movies).where(users_movies: { user_id: params[:user_id], status: 0 })

    @match = Movie.where(id: users_movies, id: friend_movies).sample
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :public_list_uid)
  end
end
