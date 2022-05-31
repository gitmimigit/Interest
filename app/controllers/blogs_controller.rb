class BlogsController < ApplicationController
  def create
    Blog.create(blog_params)
  end

  def show
    @blog = Blog.find(params[:id])
  end

  private
  def blog_params
    params.require(:blog).permit(:blog_title, :blog_text).merge(user_id: current_user.id, category_id: params[:category_id])
  end
end
