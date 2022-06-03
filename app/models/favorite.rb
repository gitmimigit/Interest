class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :favorite_name,     presence: true
  validates :favorite_profile,  presence: true
  validates :favorite_image,  presence: true
  validates :favorite_name, uniqueness: { scope: :user_id }
end
