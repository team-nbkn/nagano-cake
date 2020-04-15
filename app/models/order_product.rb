class OrderProduct < ApplicationRecord

  belong_to :order_infomation
  belong_to :product

end
