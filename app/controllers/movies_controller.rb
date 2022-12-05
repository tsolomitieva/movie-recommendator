class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: %i[show edit add_to_list remove_from_list]
  
 
  # GET /movies or /movies.json
  def index

    @q = Movie.includes(:categories, poster_attachment: :blob).ransack(params[:q])
    @movies = @q.result(distinct: true).page params[:page]

  end

  # GET /movies/1 or /movies/1.json
  def show
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

    
  def add_to_list
      @users_movie = UsersMovie.new(user_id: current_user.id, movie_id: @movie.id)
      if @users_movie.save
        redirect_to movies_path 
      else
         render :new, status: :unprocessable_entity 
      end
      
  end

  def remove_from_list
    #@users_movie = UsersMovie.find_by(user_id: current_user.id, movie_id: @movie.id).destroy
    @users_movie = current_user.users_movies.find_by(movie_id: @movie.id)
    if @users_movie.destroy
      redirect_to movies_path
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
