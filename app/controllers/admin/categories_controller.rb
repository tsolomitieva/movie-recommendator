class Admin::CategoriesController < AdminController
    
  def new
    @category = Category.new
  end

  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

   # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name)
  end
end
