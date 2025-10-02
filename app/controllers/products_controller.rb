class ProductsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    @shop = Shop.find(params[:shop_id])
    @products = @shop.products
  end

  def show
    @product = Product.find(params[:id])
  end

  # protected actions
  def new
    @shop = current_user.shop
    @product = @shop.products.new
  end

  def create
    @shop = current_user.shop
    @product = @shop.products.new(product_params)
    if @product.save
      redirect_to shop_product_path(@shop, @product), notice: "Product created"
    else
      render :new
    end
  end

  def edit
    @product = current_user.shop.products.find(params[:id])
  end

  def update
    @product = current_user.shop.products.find(params[:id])
    if @product.update(product_params)
      redirect_to shop_product_path(@product.shop, @product), notice: "Product updated"
    else
      render :edit
    end
  end

  def destroy
    @product = current_user.shop.products.find(params[:id])
    @product.destroy
    redirect_to shop_products_path(current_user.shop), notice: "Product deleted"
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
