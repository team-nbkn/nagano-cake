class OrderInformation < ApplicationRecord

  belongs_to :costomer
  has_many :order_products

  validates :payment_method, presence: true
  validates :payment_amount, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :name, presence: true
end
