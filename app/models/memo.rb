class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :favorite

  validates :memo_title, presence: true
  validates :memo_text,  presence: true
end
