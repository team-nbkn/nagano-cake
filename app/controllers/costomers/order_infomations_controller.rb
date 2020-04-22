class Costomers::OrderInfomationsController < ApplicationController

  layout 'costomers'

  before_action :order_params, only: [:confirm, :create]

  def new
    @order_information = OrderInformation.new
    @costomer = current_costomer
    @shippings = current_costomer.shippings
  end

  def confirm
    binding.pry
    @cart_items = CartItem.where(costomer_id: current_costomer.id)
    @total = current_costomer.total_price
    @order_information = OrderInformation.new
    # @order_information = order_params
    @order_information.costomer = current_costomer
    @costomer = current_costomer
    @shippings = current_costomer.shippings

#受け取る物
    @payment_method = params[:payment_method]
    @address_type = params[:address_type]
    @select = params[:select]
    @new_postcode = params[:new_postcode]
    @new_address = prams[:new_address]
    @new_name = params[:new_name]
  end

    def create
      @order_information = OrderInformation.new(order_information_params)
      # @cart_items = CartItem.all
        if @order_information.save
          #   @cart_items = CartItem.all
          #   @cart_items.destroy_all
          redirect_to costomers_order_infomations_thank_path
       end
      # 動作
      # 注文情報作成
      # 注文商品作成
      # カートを空にする
      # 配送先を作成（新規配送先の場合のみ）
    end

  def thank
  end

  def index
  end

  def show
  end

  private
    def order_information_params
      params.require(:order_information).permit(:payment_method, :payment_amount, :customer_id, :status, :address, :postcode, :name)
    end

    def order_params
      @order_information = OrderInformation.new(params.require(:order_information).permit(:payment_method, :payment_amount, :customer_id, :status, :address, :postcode, :name))
    end
end
