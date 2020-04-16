class Admins::CategoriesController < ApplicationController

  layout 'admins'

  def index
  end

  def edit
  end

  def create
  end

  def update
  end

  private
    def category_params
      params.require(:category).permit(:name,  :status)
    end
end
