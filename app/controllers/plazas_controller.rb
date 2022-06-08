class PlazasController < ApplicationController
  def index
    @blogs =Blog.order(updated_at: :desc).limit(3)
    @favorites =Favorite.order(updated_at: :desc).limit(3)
    @blogs_category = Category.joins(:blogs).group(:category_name).count
    @favorite_category = Category.joins(:favorites).group(:category_name).count
    @memo_category = Category.joins(favorites: :memos).group(:category_name).count
    @favorite_categories = @favorite_category.merge(@memo_category){|key, v1, v2| v1 + v2}
  end
end
