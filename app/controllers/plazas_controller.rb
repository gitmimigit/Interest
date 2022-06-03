class PlazasController < ApplicationController
  def index
    @blogs =Blog.order(updated_at: :desc).limit(3)
    @favorites =Favorite.order(updated_at: :desc).limit(3)
    #@blog =Blog.find(4)
  end
end
