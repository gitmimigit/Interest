class CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)
    if @category.save
      
    else
      @blog = Blog.new
      render "posts/new"
    end
  end

  private
  def category_params
    params.require(:category).permit(:category_name ).merge(user_id: current_user.id )
  end
end
