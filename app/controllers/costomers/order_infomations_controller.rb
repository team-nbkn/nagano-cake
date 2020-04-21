class Costomers::OrderInfomationsController < ApplicationController

  layout 'costomers'

  def new
    @order_information = OrderInformation.new
    @costomer = current_costomer
    @shippings = current_costomer.shippings
    sp = []
    @shippings.each do |shipping|
      sp << shipping.postcode + shipping.address + shipping.name
    end
    @sp_all = sp
  end

  def confirm
    @order_information = OrderInformation.new(order_information_params)
    render :new if @order_information.invalid?
    @order_information.payment_method = params["payment_method"]
    @order_information.address = params["address"]
    # 動作
      # 注文情報作成
      # 注文商品作成
      # カートを空にする
      # 配送先を作成（新規配送先の場合のみ）
    # @order_information = OrderInformation.new
    # @costomer = current_costomer

      # @cart_items = CartItem.all
      # if @order_information.save
      #   @cart_items = CartItem.all
      #   @cart_items.destroy_all
      #   redirect_to costomers_order_infomations_thank_path
      # end
  end

    def create
      @order_information = OrderInformation.new(order_information_params)
      respond_to do |format|
         if params[:back]
           format.html { render :new }
         else @order_information.save
           format.html { redirect_to costomers_order_infomations_thank_path }
           format.json { render :show, status: :created, location: @order_information }
         end
       end
    end

  def thank
  end

  def index
  end

  def show
  end

  private
    def order_information_params
      params.require(:order_information).permit(:payment_method, :payment_amount, :customer_id, :status, :address, :postcode, :name, :order_information,)
    end
end
