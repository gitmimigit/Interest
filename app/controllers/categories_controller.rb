class CategoriesController < ApplicationController
  def create
    Category.create(category_params)
  end

  private
  def category_params
    params.require(:category).permit(:category_name, user_ids: [])
  end
end
