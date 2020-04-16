class Costomers::ShippingsController < ApplicationController

  layout 'costomers'

  def index
  end

  def edit
  end

  private
    def shipping_params
      params.require(:shipping).permit(:costomer_id, :postcode, :address, :name)
    end
end
