class Admins::ProductsController < ApplicationController

  layout 'admins'

  def edit
  end

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    # @product.category_id = 1
    # @product.status = 1
    # @product.price = 500
    @product.save!
    redirect_to admins_products_path
  end

    # <% if @product.image_id? %>
    #   <%= image_tag @product.image.url %>
    # <% else %>
    #   <%= image_tag("/images/no_image.jpg") %>
    # <% end %>
    # <%= ca.select :category_id, Category.all.collect{ |c| [ c.name]} %>

  private
    def product_params
      params.require(:product).permit(:name, :content, :price, :image, :category_id, :status)
    end
end
