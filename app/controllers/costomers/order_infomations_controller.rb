class Costomers::OrderInfomationsController < ApplicationController
  def new
  end

  def confirm
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
end
