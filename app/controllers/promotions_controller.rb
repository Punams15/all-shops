class PromotionsController < ApplicationController
  def show
    @promotion = Promotion.find(params[:id])
  end

  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = Promotion.new(promotion_params)
    if @promotion.save
      redirect_to @promotion, notice: "Promotion created successfully."
    else
      render :new
    end
  end

  def edit
    @promotion = Promotion.find(params[:id])
  end

  def update
    @promotion = Promotion.find(params[:id])
    if @promotion.update(promotion_params)
      redirect_to @promotion, notice: "Promotion updated successfully."
    else
      render :edit
    end
  end

  private

  def promotion_params
    params.require(:promotion).permit(:name, :discount, :start_date, :end_date)
  end
end
