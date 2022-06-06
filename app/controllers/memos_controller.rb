class MemosController < ApplicationController
  before_action :set_favorite, only: [:new, :create, :edit, :show, :update, :destroy]
  
  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.create(memo_params)
    unless @memo.save
      render :new
    end
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

  def memo_params
    params.require(:memo).permit(:memo_title, :memo_text, :memo_image).merge(user_id: current_user.id, favorite_id: params[:favorite_id])
  end
end
