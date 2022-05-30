class PostsController < ApplicationController
  def new
    @category = Category.new
  end

  private
  
end
