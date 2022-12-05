class UsersMoviesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_movie, only: %i[:show, :edit ]

    def create
        @users_movie = UsersMovie.new(user_id: current_user.id, movie_id: params[:movie_id])
        respond_to do |format|
          if @users_movie.save
              format.html { redirect_to movies_url(), notice: "Movie was added to your list." }
          else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @users_movie.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
      @users_movie = UsersMovie.find(user_id: current_user.id, movie_id: params[:movie_id]).destroy
       respond_to do |format|
          if @users_movie.destroy
              format.html { redirect_to movies_url(), notice: "Movie was deleted from your list." }
          else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @users_movie.errors, status: :unprocessable_entity }
          end
        end
    end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_users_movie
    @users_movie = Users_movie.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def users_movie_params
    params.require(:users_movie).permit(:user_id, :movie_id)
  end
  
end
