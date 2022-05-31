class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :show,:update]
  before_action :set_user, only: [:update, :destroy]

  def create
    Blog.create(blog_params)
  end

  def show
  end

  def edit
  end

  def update
    @blog.update(blog_params)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
  end

  private
  def blog_params
    params.require(:blog).permit(:blog_title, :blog_text).merge(user_id: current_user.id, category_id: params[:category_id])
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
