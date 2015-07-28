class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create category_params

    if @category.save
      redirect_to categories_path, flash: {success: "#{@category.name} created!"}
    else
      render :new
    end
  end

  def show
  end

  def edit

  end

  def update
    @category.update category_params
    if @category.save
      redirect_to categories_path, flash: {success: "#{@category.name} updated!"}
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(
    :name,
    :color
    )
  end

  def set_category
    @category = Category.find params[:id]
  end
end
