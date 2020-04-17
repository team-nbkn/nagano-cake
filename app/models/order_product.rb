class OrderProduct < ApplicationRecord

  belongs_to :order_infomation
  belongs_to :product

end
