class Costomers::CartItemsController < ApplicationController
  layout 'costomers'

  def show
  end

  def create
  	@cart_item = CartItem.new(cart_item_params)
  	if @cart_item.save
  		redirect_to costomers_cart_item_path(@cart_item.id)
  	end
  end

  private
    def cart_item_params
    	{}.tap do |cart_item|
    		cart_item["product_id"] = params["product_id"]
    		cart_item["order_quantity"] = params["order_quantity"]
    		cart_item["costomer_id"] = current_costomer.id
    	end
    end
end
