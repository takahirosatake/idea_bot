class Api::V1::CategoriesController < Api::V1::BaseController
  protect_from_forgery
  def index
    categories = Category.all
    render json: categories
  end

  def create
    category = Category.new(category_params)
    if category.save
      render json: { status: 201 } 
    else
      render json: { status: 422 }
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end


