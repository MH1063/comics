class Comic < ApplicationRecord
  belongs_to :user
  
  validates :tittle, presence: true, length: {maximum: 255}
  validates :author, presence: true, length: {maximum: 255}
  validates :price, presence: true, length: {maximum: 255}
  validates :review, presence: true
  
  has_one_attached :picture
end
