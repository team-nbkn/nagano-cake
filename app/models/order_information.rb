class OrderInformation < ApplicationRecord

  belongs_to :costomer
  has_many :order_products

  validates :payment_method, presence: true
  validates :payment_amount, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :name, presence: true

  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済: 4 }
  enum payment_method: { クレジットカード: 0, 銀行振り込み: 1 }
  enum address: { ご自身の住所: 0, 登録済住所から選択: 1, 新しいお届け先: 2 }
end
