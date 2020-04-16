class Costomers::ProductsController < ApplicationController

  layout 'costomers'

  def index
  end

  def show
  end

  def top
  end

  private
    def product_params
      params.require(:product).permit(:name, :content, :price, :image, :category_id, :status)
    end
end
