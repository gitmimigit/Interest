class PlazasController < ApplicationController
  def index
    @blog = Blog.last
  end
end
