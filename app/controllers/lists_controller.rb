class ListsController < ApplicationController
  def index
    @blog = Blog.includes(:user, :category).order("created_at DESC")
  end
end
