class Admins::ProductsController < ApplicationController

  layout 'admins'

  def edit
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
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
    redirect_to admins_product_path(@product.id)
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admins_product_path(@product.id)
  end

    # <% if @product.image_id? %>
    #   <%= image_tag @product.image.url %>
    # <% else %>
    #   <%= image_tag("/images/no_image.jpg") %>
    # <% end %>
    # <%= ca.select :category_id, Category.all.collect{ |c| [ c.name]} %>
    # <%= ca.select :status, [['販売中止', 0], ['販売中', 1]],{ class: "status"} %>
  private
    def product_params
      params.require(:product).permit(:name, :content, :price, :image, :category_id, :status)
    end
end
