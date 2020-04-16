class Costomers::CostomersController < ApplicationController

  layout 'costomers'

  def show
    @costomer = current_costomer
  end

  def edit
    @costomer = current_costomer
  end

  def update
  end

  def new
  end

  private
  def costomer_params
    params.require(:costomer).permit(:first_name, :last_name, :first_kana_name, :last_kana_name, :postcode, :address, :phone, :status, :email, :password)
  end
end
