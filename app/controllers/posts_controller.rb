class PostsController < ApplicationController
  def new
    @category = Category.new
    # @categories = Category.all.order("created_at DESC")
    @blog = Blog.new
  end

  private
  
end
