class PostsController < ApplicationController
  def new
    @category = Category.new
    @blog = Blog.new
    @favorite = Favorite.new
  end

  private
  
end
