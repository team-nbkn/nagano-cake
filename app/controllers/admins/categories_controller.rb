class Admins::CategoriesController < ApplicationController

  layout 'admins'
  before_action :authenticate_admin!

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
    if @category.save
      redirect_to admins_categories_path
      flash[:notice] = "ジャンルを追加しました"
    else
      @category = Category.new
      @categories = Category.all
      render :index
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admins_categories_path
      flash[:notice] = "ジャンル変更を保存しました"
    else
      render :edit
    end
  end

  private
    def category_params
      params.require(:category).permit(:name, :status)
    end
end
