class Admins::CostomersController < ApplicationController

  layout 'admins'

  def show
    @costomer = Costomer.find(params[:id])
  end

  def edit
    @costomer = Costomer.find(params[:id])
  end

  def index
    @costomers = Costomer.with_discarded
  end

  def update
    @costomer = Costomer.find(params[:id])
    @costomer.update(costomer_params)
    redirect_to admins_costomer_path(@costomer.id)
  end

  def top
    @order_information = OrderInformation.where(created_at: 1.day.ago.all_day)
  end

  private
    def costomer_params
      params.require(:costomer).permit(:first_name, :last_name,  :first_kana_name, :last_kana_name, :postcode, :address, :phone, :status, :email, :password, :password_confirmation)
    end
end
