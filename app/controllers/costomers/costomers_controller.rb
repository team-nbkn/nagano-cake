class Costomers::CostomersController < ApplicationController
  def show
  end

  def edit
  end

  def new
  end

  private
  def costomer_params
    params.require(:costomer).permit(:first_name, :last_name, :first_kana_name, :last_kana_name, :postcode, :address, :phone, :status,)
  end
end
