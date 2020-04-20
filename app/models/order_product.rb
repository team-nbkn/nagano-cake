class OrderProduct < ApplicationRecord

  belongs_to :order_infomation
  belongs_to :product

  enum status: { 着手不可: 0, 制作待ち: 1, 製作中: 2, 制作完了: 3 }

end
