class UsersController < ApplicationController

   before_action :authenticate_user!
   before_action :set_user, only: %i[movie_list]
   
   def movie_list
        @user = User.find_by(public_list_uid: params[:public_list_uid])
    if @user
        #get movies with want_to_see status from the given list url 
        @movies_list = Movie.joins(:users_movies).where(users_movies: {user: @user} )
        @movies = @movies_list.includes(:categories, :users_movies,  poster_attachment: :blob).page params[:page]
    else
        redirect_to movies_path, notice: "User wasn't found"
    end
   end
   

   private 

    def set_user
        @user = User.find(params[:id])
    end

      
    def user_params
        params.require(:user).permit(:email, :password, :public_list_uid)
    end
end