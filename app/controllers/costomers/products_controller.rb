class Costomers::ProductsController < ApplicationController

  layout 'costomers'

  def index
    @categories = Category.all
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @products = @category.products.all
    else
      @products = Product.all
    end
  end

  def show
     @categories = Category.all
     @product = Product.find(params[:id])
  end

  def top
      @categories = Category.all
      @products = Product.all
  end

  private
    def product_params
      params.require(:product).permit(:name, :content, :price, :image, :category_id, :status)
    end
end
