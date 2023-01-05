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
    @users = @q.result
  end

  # add friend
  def add_friend
    @friend = UsersFriend.new(user_id: current_user.id, friend_id: params[:friend_id])
    respond_to do |_format|
      if @friend.save
        redirect_to add_friend_path, notice: 'Friend was added.'
      else
        redirect_to add_friend_path, notice: 'Error in adding friend.'
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :public_list_uid)
  end
end
