class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.order(updated_at: :desc).limit(1)
    #@blog =Blog.find(4)
  end
end
