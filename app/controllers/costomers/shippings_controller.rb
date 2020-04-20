class Costomers::ShippingsController < ApplicationController

  layout 'costomers'

  def index
  	@shippings = Shipping.where(costomer_id: current_costomer.id)
  	@shipping = Shipping.new
  end

  def edit
  	@shipping = Shipping.find(params[:id])
  end

  def update
  	@shipping = Shipping.find(params[:id])
  	if @shipping.update(shipping_params)
       flash[:notice] = "successfully updated."
       redirect_to costomers_shippings_path(@shipping.id)
    else
       render("shippings/edit")
    end
  end

  def create
  	@shipping = current_costomer.shippings.new(shipping_params)
  	@shipping.save
  	redirect_to costomers_shippings_path
  end

  def destroy
  	@shipping = Shipping.find(params[:id])
  	@shipping.destroy!
  	redirect_to costomers_shippings_path
  end

  private
    def shipping_params
      params.require(:shipping).permit(:costomer_id, :postcode, :address, :name)
    end
end
