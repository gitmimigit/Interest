class ListsController < ApplicationController
  def index
    @blog = Brog.includes(:user, :category).order("created_at DESC")
  end
end
