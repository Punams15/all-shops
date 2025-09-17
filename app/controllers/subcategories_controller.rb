class SubcategoriesController < ApplicationController
  before_action :set_category

  def show
    @subcategory = @category.subcategories.find(params[:id])
  end

  def new
    @subcategory = @category.subcategories.new
  end

  def create
    @subcategory = @category.subcategories.new(subcategory_params)
    if @subcategory.save
      redirect_to [@category, @subcategory], notice: "Subcategory created successfully."
    else
      render :new
    end
  end

  def edit
    @subcategory = @category.subcategories.find(params[:id])
  end

  def update
    @subcategory = @category.subcategories.find(params[:id])
    if @subcategory.update(subcategory_params)
      redirect_to [@category, @subcategory], notice: "Subcategory updated successfully."
    else
      render :edit
    end
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def subcategory_params
    params.require(:subcategory).permit(:name, :description)
  end
end
