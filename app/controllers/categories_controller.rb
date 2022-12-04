class CategoriesController < ApplicationController
  before_action :authenticate_user!

    # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_category_url(@category), notice: "Category was added." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

 
  def update
    respond_to do |format|
      if @category.update(movie_params)
        format.html { redirect_to admin_category_url(@category), notice: "Category was added." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was deleted." }
      format.json { head :no_content }
    end
  end
end
