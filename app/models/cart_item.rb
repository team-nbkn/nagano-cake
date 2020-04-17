class CartItem < ApplicationRecord

  belongs_to :costomer
  belongs_to :product

  validates :order_quantity, presence: true
end
