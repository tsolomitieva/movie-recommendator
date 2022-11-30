class Admin::MoviesController < AdminController
    before_action :set_movie, only: [:show, :edit]
 
    def edit
    end

    def create
        @movie = Movie.new(movie_params)
        respond_to do |format|
        if @movie.save
            format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
            format.json { render :show, status: :created, location: @movie }
        else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @movie.errors, status: :unprocessable_entity }
        end
        end
    end

    def new
        @movie = Movie.new
    end

    def destroy
        @movie.destroy

        respond_to do |format|
        format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
        format.json { head :no_content }
        end
    end


    def update
        respond_to do |format|
            if @movie.update(movie_params)
                format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
                format.json { render :show, status: :ok, location: @movie }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @movie.errors, status: :unprocessable_entity }
            end
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

