class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_categories
  has_many :categories, through: :user_categories

  validates :user_name, presence: true, length: { maximum: 8 }
end
