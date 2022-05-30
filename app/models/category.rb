class Category < ApplicationRecord
  has_many :user_categories
  has_many :users, through: :user_categories

  validates :category_name, presence: true
end
