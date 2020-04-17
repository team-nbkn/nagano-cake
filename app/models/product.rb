class Product < ApplicationRecord

  belongs_to :admin
  belongs_to :category
  has_many :cart_items
  has_one :order_product

  attachment :image

  validates :name, presence: true
  validates :content, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :status, presence: true
  validates :category_id, presence: true
end
