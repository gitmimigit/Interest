class MemosController < ApplicationController
  before_action :set_favorite, only: [:new, :edit, :update, :destroy]
  before_action :set_memo, only: [ :edit, :update, :destroy]
  
  def show
    @favorite = Favorite.find(params[:favorite_id])
    @memo = Memo.find(params[:id])
  end

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
    @user =User.find(@memo.user_id)
    @memo.update(memo_params) 
    unless @memo.save
      render :edit
    end
  end

  def destroy
    @user =User.find(@memo.user_id)
    if current_user.id == @memo.user_id
      @memo.destroy
    end
  end

  private

  def set_favorite
    @favorite = Favorite.find(params[:favorite_id])
  end

  def set_memo
    @memo = Memo.find(params[:favorite_id])
  end

  def memo_params
    params.require(:memo).permit(:memo_title, :memo_text, :memo_image).merge(user_id: current_user.id, favorite_id: params[:favorite_id])
  end
end
