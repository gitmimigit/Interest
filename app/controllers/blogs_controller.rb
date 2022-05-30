class BlogsController < ApplicationController
  def create
    Blog.create(blog_params)
  end

  private
  def blog_params
    params.require(:blog).permit(:blog_title, :blog_text).merge(user_id: current_user.id)
  end
end
