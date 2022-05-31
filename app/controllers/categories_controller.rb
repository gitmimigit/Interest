class CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      @blog = Blog.new
      render "posts/new"
    end
  end

  private
  def category_params
    params.require(:category).permit(:category_name, user_ids: [])
  end
end
