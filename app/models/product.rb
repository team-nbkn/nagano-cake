class Product < ApplicationRecord

  belongs_to :category
  has_many :cart_items
  has_one :order_product

  attachment :image
  enum status: { 販売中: 1, 販売中止: 0 }

  validates :name, presence: true
  validates :content, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :status, presence: true
  validates :category_id, presence: true
end
