class Costomers::CartItemsController < ApplicationController
  layout 'costomers'
  before_action :authenticate_costomer!

  def show
    @cart_items = CartItem.where(costomer_id: current_costomer.id)
    @products = Product.all
    @total = current_costomer.total_price
  end

  def create
  	@cart_item = CartItem.new(cart_item)
  	if @cart_item.save
  		redirect_to costomers_cart_item_path(@cart_item.id)
  	end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
       redirect_to costomers_cart_item_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to costomers_cart_item_path(@cart_item.id)
  end

  def all_destroy
    @cart_items = CartItem.all
    @cart_items.destroy_all
    redirect_to costomers_products_top_path
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:costomer_id, :product_id, :order_quantity)
    end

    def cart_item
    	{}.tap do |cart_item|
    		cart_item["product_id"] = params["product_id"]
    		cart_item["order_quantity"] = params["order_quantity"]
    		cart_item["costomer_id"] = current_costomer.id
    	end
    end
end
