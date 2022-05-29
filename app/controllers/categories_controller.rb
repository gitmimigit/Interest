class CategoriesController < ApplicationController
  def create
    Category.create(category_params)
  end

  private
  def category_params
    params.require(:category).permit(:category_name).merge(user_id: current_user.id)
  end
end
