class PostsController < ApplicationController
  def new
    @category = Category.new
    @blog = Blog.new
  end

  private
  
end
