class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @blog = @user.blogs.order(updated_at: :desc).limit(1)
    @favorite = @user.favorites.order(updated_at: :desc).limit(1)
    #@blog = Blog.find(params[:id])
    #@favorite = Favorite.find(params[:id])
    @blog_categories = @user.categories.joins(:blogs).group(:category_name).count
    @favorite_categories = @user.categories.joins(:favorites).group(:category_name).count
    @memo_categories = @user.memos.joins(favorite: :category).group(:category_name).count
    #@categories = @blog_categories.merge(@favorite_categories, @memo_categories) 
    @categories = @blog_categories.merge(@favorite_categories, @memo_categories) {|key, v1, v2| v1 + v2}
  end
end
