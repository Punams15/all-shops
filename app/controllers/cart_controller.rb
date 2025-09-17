class CartController < ApplicationController
  def show
    @cart = Cart.first || Cart.create
  end
end
