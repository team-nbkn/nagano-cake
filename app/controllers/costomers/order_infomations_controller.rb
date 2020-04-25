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
    @shipping = current_costomer.shippings.all
    # @shipping = Shipping.find(params[:shipping])

#受け取る物
    @payment_method = params[:payment_method]
    @address_type = params[:address_type]
    # @select = params[:select]
    @new_postcode = params[:new_postcode]
    @new_address = params[:new_address]
    @new_name = params[:new_name]
  end

    def create
      @order_information = OrderInformation.new(order_information_params)
      @order_information.costomer_id = current_costomer.id
      @total = current_costomer.total_price
      @total_price = @total + 800
      @order_information.payment_amount = @total_price

        if @order_information.save
          @shipping = Shipping.new
          @shipping.postcode = params[:order_information][:postcode]
          @shipping.address = params[:order_information][:address]
          @shipping.name = params[:order_information][:name]
          @shipping.costomer_id = current_costomer.id
          @shipping.save
          #     @shipping.errors.full_messages.each do |msg|
          #       pp msg
          #     end
          # end
        # else
        #   @order_information.errors.full_messages.each do |msg|
        #     pp msg
        #   end
        end

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

    # def order_params
    #   @order_information = OrderInformation.new(params.require(:order_information).permit(:payment_method, :payment_amount, :customer_id, :status, :address, :postcode, :name))
    # end
end
