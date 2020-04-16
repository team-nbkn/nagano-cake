class Admins::OrderInformationsController < ApplicationController

  layout 'admins'

  def index
  end

  def show
  end

  private
    def order_information_params
      params.require(:order_information).permit(:payment_method, :payment_amount, :customer_id, :status, :address, :postcode, :name)
    end
end
