class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: %i[show edit add_movie_status delete_movie_status]

  # GET /movies or /movies.json
  def index
    @q = Movie.includes(:categories, :users_movies,  poster_attachment: :blob).ransack(params[:q])
    @movies = @q.result(distinct: true).page params[:page]
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # adding like, dislike, want to see
  def add_movie_status
    @movie_list = UsersMovie.where(user: current_user, movie: @movie).first_or_initialize
    @movie_list.status = params[:status]
    if @movie_list.save
      render @movie
    else
      render :new, status: :unprocessable_entity
    end
  end

  # removing like, dislike, want to see by pressing button again
  def delete_movie_status
    @users_movie = current_user.users_movies.find_by(movie_id: @movie.id)
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
    params.require(:movie).permit(:poster, :title, :plot, :rating, :year, :poster, :tag_list, category_ids: [])
  end
end

