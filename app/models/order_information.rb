class OrderInformation < ApplicationRecord

  belongs_to :costomer
  has_many :order_products

  validates :payment_method, presence: true
  validates :payment_amount, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :name, presence: true

  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済: 4 }

end
