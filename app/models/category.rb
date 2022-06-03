class Category < ApplicationRecord
  belongs_to :user
  has_many :blogs
  has_many :favorites

  validates :category_name, presence: true
  validates :category_name, uniqueness: { scope: :user_id }
end
