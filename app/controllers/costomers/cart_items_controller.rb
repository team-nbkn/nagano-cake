class Costomers::CartItemsController < ApplicationController
  layout 'costomers'

  def show
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:costomer_id, :product_id, :order_quantity)
    end
end
