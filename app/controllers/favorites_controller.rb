class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:edit, :show, :update, :destroy]
  #before_action :set_user, only: :create

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      
    else
      @category = Category.new
      @blog = Blog.new
      render "posts/new"
    end
  end

  def show
  end

  def edit
  end

  def update
    @user =User.find(@favorite.user_id)
    if @favorite.update(favorite_params) 
      
    else
      render :edit
    end
  end

  def destroy
    @user =User.find(@favorite.user_id)
    if current_user.id == @favorite.user_id
    @favorite.destroy
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:favorite_name, :favorite_profile, :favorite_image).merge(user_id: current_user.id, category_id: params[:category_id])
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
