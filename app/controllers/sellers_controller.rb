class SellersController < ApplicationController
  before_action :set_seller, only: [:show, :edit, :update]

  def index
    @sellers = Seller.all
  end

  def show
  end

  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_params)
    if @seller.save
      redirect_to @seller, notice: "Seller created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @seller.update(seller_params)
      redirect_to @seller, notice: "Seller updated successfully!"
    else
      render :edit
    end
  end

  private

  def set_seller
    @seller = Seller.find(params[:id])
  end

  def seller_params
    params.require(:seller).permit(:name, :profile_description, :email)
  end
end
