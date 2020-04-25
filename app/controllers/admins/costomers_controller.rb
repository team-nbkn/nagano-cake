class Admins::CostomersController < ApplicationController

  layout 'admins'
  before_action :authenticate_admin!

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
    if @costomer.update(costomer_params)
      redirect_to admins_costomer_path(@costomer.id)
      flash[:notice] = "顧客情報変更を保存しました"
    else
      @costomer = Costomer.find(params[:id])
      render :edit
    end
  end

  def top
    @order_information = OrderInformation.where(created_at: Date.today.all_day).count
    # @order_information = OrderInformation.where(Date.today.all_day).count
    # @order_information = OrderInformation.where("Date(created_at) = '#{Date.today}'").count
    # @order = OrderInformation.where(created_at: Date.today.all_day)
  end

  private
    def costomer_params
      params.require(:costomer).permit(:first_name, :last_name,  :first_kana_name, :last_kana_name, :postcode, :address, :phone, :status, :email, :password, :password_confirmation)
    end
end
