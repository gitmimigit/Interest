class Blog < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :blog_title, presence: true
  validates :blog_text,  presence: true
end
