class Admins::CategoriesController < ApplicationController

  layout 'admins'

  def index
    # @category = Category.find(params[:category_id])
    @category = Category.new
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to admins_categories_path
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to admins_categories_path
  end

  private
    def category_params
      params.require(:category).permit(:name, :status)
    end
end
