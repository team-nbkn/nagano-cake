class Admins::OrderInformationsController < ApplicationController

  layout 'admins'

  def index
  	@order_informations = OrderInformation.all
  end

  def show
  	@order_information = OrderInformation.find(params[:id])
  	@order_informations = OrderInformation.all
  end

  def update
  	@order_information = OrderInformation.find(params[:id])
  	@order_information.update(order_information_params)
    redirect_to admins_order_information_path(@order_information.id)
  end

  private
    def order_information_params
      params.require(:order_information).permit(:payment_method, :payment_amount, :customer_id, :status, :address, :postcode, :name)
    end
end
