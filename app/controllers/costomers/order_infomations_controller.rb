class Costomers::OrderInfomationsController < ApplicationController

  layout 'costomers'
  before_action :authenticate_costomer!

  # before_action :order_params, only: [:confirm, :create]

  def new
    # @order_information = OrderInformation.new
    @costomer = current_costomer
    # @shippings = current_costomer.shippings
    @shippings = Shipping.where(costomer_id: current_costomer.id)
  end

  def confirm
    @cart_items = CartItem.where(costomer_id: current_costomer.id)
    @total = current_costomer.total_price
    @total_price = ((@total).to_i + 800).to_i
    @order_information = OrderInformation.new
    @order_information.costomer = current_costomer
    @costomer = current_costomer

#受け取る物
    @payment_method = params[:payment_method]
    @address_type = params[:address_type]
    # @select = params[:select]
    @new_postcode = params[:new_postcode]
    @new_address = params[:new_address]
    @new_name = params[:new_name]

    if @address_type == "1"
      @shipping = current_costomer.shippings.all
    elsif @address_type == "2"
      @shipping = Shipping.find(params[:shipping])
    else @address_type == "3"
      @shipping = Shipping.find(params[:shipping])
        @shipping = Shipping.new
        @shipping.postcode = @new_postcode
        @shipping.address = @new_address
        @shipping.name = @new_name
        @shipping.costomer_id = current_costomer.id
        @shipping.save
    end
  end

    def create
      @order_information = OrderInformation.new(order_information_params)
      @order_information.costomer_id = current_costomer.id
      @total = current_costomer.total_price
      @total_price = @total + 800
      @order_information.payment_amount = @total_price
      @address_type = params[:address_type]
      @order_information.save
          #     @shipping.errors.full_messages.each do |msg|
          #       pp msg
          #     end
          # end
        # else
        #   @order_information.errors.full_messages.each do |msg|
        #     pp msg
        #   end


      current_costomer.cart_items.each do |cart_item|
        @order_product = OrderProduct.new
        @order_product.product_id = cart_item.product_id
        @order_product.order_information_id = @order_information.id
        @order_product.quantity = cart_item.order_quantity
        @order_product.price = cart_item.product.price
        @order_product.save
        cart_item.destroy
      end
          redirect_to costomers_order_infomations_thank_path
    end

  def thank
  end

  def index
    @order_informations = OrderInformation.where(costomer_id: current_costomer.id).order(created_at: :desc)
    @total = current_costomer.total_price
    @total_price = ((@total).to_i + 800).to_i
    @order_products = OrderProduct.all
  end

  def show
    @order_information = OrderInformation.find(params[:id])
    # @order_products = @order.order_products
    # @order_products = OrderProduct.all
    @order_products = OrderProduct.where(order_information_id: @order_information.id)
  end

  private
    def order_information_params
      params.require(:order_information).permit(:payment_method, :payment_amount, :costomer_id, :status, :address, :postcode, :name)
    end
end
