class MemosController < ApplicationController
  before_action :set_favorite, only: [:new, :edit, :show, :update, :destroy]
  
  def new
    @memo = Memo.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_favorite
    @favorite = Favorite.find(params[:favorite_id])
  end
end
