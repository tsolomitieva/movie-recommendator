class Admin::MoviesController < AdminController
    before_action :set_movie, only: [:show, :edit]
 
    def edit
    end

    def new
        @movie = Movie.new
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

