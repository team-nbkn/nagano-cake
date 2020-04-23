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
    if @product.save!
     redirect_to admins_product_path(@product.id)
     flash[:notice] = "商品を追加しました"
    else
      @product = Product.new
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admins_product_path(@product.id)
      flash[:notice] = "商品情報変更を保存しました"
    else
      @product = Product.find(params[:id])
      render :edit
    end
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
