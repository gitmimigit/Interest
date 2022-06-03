class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @blog = @user.blogs.order(updated_at: :desc).limit(1)
    @favorite = @user.favorites.order(updated_at: :desc).limit(1)
    #@blog = Blog.find(params[:id])
    #@favorite = Favorite.find(params[:id])
  end
end
