class UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :set_user, only: %i[movie_list]
   
   def movie_list
    #get movies with want_to_see status from the given list url 
    @user = User.find_by(list: params[:url])
    @want_to_see_movies = Movie.joins(:users_movies).where(users_movies: {status: 0}, users_movies:{user: @user})
    @movies = @want_to_see_movies.includes(:categories, :users_movies,  poster_attachment: :blob).page params[:page]
    
    
   end
   

   private 

    def set_user
        @user = User.find(params[:id])
    end

      
    def movie_params
        params.require(:user).permit(:email, :password, :list)
    end
end