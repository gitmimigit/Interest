class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :show,:update, :destroy]
  #before_action :set_user, only: :create

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      
    else
      @category = Category.new
      @favorite = Favorite.new
      render "posts/new"
    end
  end

  def show
  end

  def edit
  end

  def update
    @user =User.find(@blog.user_id)
    if @blog.update(blog_params) 
      
    else
      render :edit
    end
  end

  def destroy
    @user =User.find(@blog.user_id)
    if current_user.id == @blog.user_id
    @blog.destroy
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:blog_title, :blog_text, :blog_image).merge(user_id: current_user.id, category_id: params[:category_id])
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
