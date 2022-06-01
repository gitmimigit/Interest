class PlazasController < ApplicationController
  def index
    @blogs =Blog.order(updated_at: :desc).limit(1)
    #@blog =Blog.find(4)
  end
end
