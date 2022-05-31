class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @blog = @user.blogs.last
  end
end
