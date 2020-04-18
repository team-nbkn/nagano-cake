class Admins::CostomersController < ApplicationController

  layout 'admins'

  def show
  end

  def edit
  end

  def index
  end

  def update
  end

  def top
    # @order_information=OrderInformation.where(create_at: Date.today)
        # @admins_count=Admin.where(admin_id: @admin.id).count
  end

  private
    def costomer_params
      params.require(:costomer).permit(:first_name, :last_name,  :first_kana_name, :last_kana_name, :postcode, :address, :phone, :status, :email, :password, :password_confirmation)
    end
end
  