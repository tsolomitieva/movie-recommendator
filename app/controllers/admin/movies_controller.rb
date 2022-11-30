class Admin::MoviesController < ApplicationController
 
   def index

        @q = Movie.includes(:categories, poster_attachment: :blob).ransack(params[:q])
        @movies = @q.result(distinct: true).page params[:page]

    end

    def show
    end

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
end

