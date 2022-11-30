class CategoriesController < ApplicationController
  before_action :authenticate_user!

    # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

end
