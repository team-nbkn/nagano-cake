class Admins::OrderInformationsController < ApplicationController

  layout 'admins'

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
    @order_information = OrderInformation.find(params[:id])
    @order_product.update!(order_product_params)
    if @order_product.status == "制作完了"
      @order_information.update(status: "発送準備中")
      redirect_to admins_order_information_path(@order_information.id)
    else
      redirect_to admins_order_information_path(@order_information.id)
    end
  end

  private
    def order_information_params
      params.require(:order_information).permit(:payment_method, :payment_amount, :customer_id, :status, :address, :postcode, :name)
    end

    def order_product_params
      params.require(:order_product).permit(:status)
    end
end
