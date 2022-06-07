class PlazasController < ApplicationController
  def index
    @blogs =Blog.order(updated_at: :desc).limit(3)
    @favorites =Favorite.order(updated_at: :desc).limit(3)
    #@blog =Blog.find(4)
    @blogs_category = Blog.joins(:category).group("category_name")
    @favorite_category = Favorite.joins(:category).group("category_name")
  end
end
