class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: %i[show edit add_movie_status delete_movie_status]
  
 
  # GET /movies or /movies.json
  def index

    @q = Movie.includes(:categories, poster_attachment: :blob).ransack(params[:q])
    @movies = @q.result(distinct: true).page params[:page]

  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  #adding like, dislike, want to see
  def add_movie_status
    #if record exists change status
    if UsersMovie.exists?(user_id: current_user.id, movie_id: @movie.id)
    @users_movie = UsersMovie.where(user_id: current_user.id, movie_id: @movie.id)
    if @users_movie.update(status: params[:status])
      render @movie
    else
        render :new, status: :unprocessable_entity 
    end
    else
      #add movie with status to usersmovies
      @users_movie = UsersMovie.new(user_id: current_user.id, movie_id: @movie.id, status: params[:status])
        if @users_movie.save
          render @movie
        else
          render :new, status: :unprocessable_entity 
        end
    end
  end

  #removing like, dislike, want to see by pressing button again
  def delete_movie_status
  @users_movie=current_user.users_movies.find_by(movie_id: @movie.id)
    if @users_movie.destroy
      render @movie
    else
      render :new, status: :unprocessable_entity 
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def movie_params
    params.require(:movie).permit(:poster, :title, :plot, :rating, :year, :poster, :tag_list, category_ids:[])
  end
  
end
