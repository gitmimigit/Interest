class ListsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @blog = @user.blogs.order("created_at DESC")
  end
end
