class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: %i[ show ]
  
 
  # GET /movies or /movies.json
  def index

    @q = Movie.includes(:categories, poster_attachment: :blob).ransack(params[:q])
    @movies = @q.result(distinct: true).page params[:page]

  end

  # GET /movies/1 or /movies/1.json
  def show
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
