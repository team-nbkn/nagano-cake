class Costomers::CostomersController < ApplicationController

  layout 'costomers'
  before_action :authenticate_costomer!

  def show
    @costomer = current_costomer
  end

  def edit
    @costomer = current_costomer
  end

  def update
    @costomer = current_costomer

    if @costomer.update(costomer_params)
       flash[:notice] = "successfully updated."
       redirect_to costomers_costomers_path(@costomer.id)
    else
       render("costomers/edit")
    end
  end

  def withdraw
  end

  def destroy
    @costomer = current_costomer
    @costomer.discard
    redirect_to costomers_products_top_path
  end

  private
  def costomer_params
    params.require(:costomer).permit(:first_name, :last_name, :first_kana_name, :last_kana_name, :postcode, :address, :phone, :status, :email, :password)
  end
end
