class Costomer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shippings
  has_many :order_informations
  has_many :cart_items, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_kana_name, presence: true
  validates :last_kana_name, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :phone, presence: true

  enum status: { 退会済: 1, 有効: 0 }

  include Discard::Model
  default_scope -> { kept }

  def total_price
    array = []
    cart_items.each do |cart_item|
      array << (cart_item.product.price * cart_item.order_quantity * 1.1).to_i
    end
    return array.sum
  end
end
