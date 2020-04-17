class Category < ApplicationRecord

  has_many :products

  validates :name, presence: true
  validates :status, presence: true

  enum status: { 無効: 1, 有効: 0 }
end
