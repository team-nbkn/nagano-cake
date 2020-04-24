class Admins::OrderInformationsController < ApplicationController

  layout 'admins'
  before_action :authenticate_admin!

  def index
  	@order_informations = OrderInformation.all
  end

  def show
  	@order_information = OrderInformation.find(params[:id])
    @order_products = @order_information.order_products
  end

  def update
  	@order_information = OrderInformation.find(params[:id])
    @order_products = @order_information.order_products
  	@order_information.update(order_information_params)
    if @order_information.status == "入金確認"
      @order_products.update(status: "制作待ち")
      redirect_to admins_order_information_path(@order_information.id)
    else
      redirect_to admins_order_information_path(@order_information.id)
    end
  end

  def order_product_update
    @order_product = OrderProduct.find(params[:id])
    @order_products = OrderProduct.find(params[:id]).order_information.order_products
    @order_product.update!(order_product_params)
    if @order_product.status == "製作中"
        @order_product.order_information.update(status: "製作中")
    elsif @order_products.map{|o| o.status}.all? {|o| o == "制作完了" }
        @order_product.order_information.update(status: "発送準備中")
    end
    redirect_to admins_order_information_path(@order_product.order_information.id)
  end

  private
    def order_information_params
      params.require(:order_information).permit(:payment_method, :payment_amount, :customer_id, :status, :address, :postcode, :name)
    end

    def order_product_params
      params.require(:order_product).permit(:status)
    end
end
