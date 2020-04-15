class Shipping < ApplicationRecord

  belong_to :costomer

  validates :postcode, presence: true
  validates :address, presence: true
  validates :name, presence: true

end
