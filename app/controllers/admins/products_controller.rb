class Admins::ProductsController < ApplicationController
  def edit
  end

  def index
  end

  def show
  end

  private
    def product_params
      params.require(:product).permit(:name, :content, :price, :image, :category_id, :status)
    end
end
