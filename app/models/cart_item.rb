class CartItem < ApplicationRecord

  belong_to :costomer
  belong_to :product

  validates :order_quantity, presence: true
end
