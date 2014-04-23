class CartsController < ApplicationController

  def create
    @cart = Cart.new(params[:cart])
    if @cart.save
      redirect_to @cart
    else
      render :edit
    end
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy if cart.id == session[:cart_id]
    session[:cart_id] = nil
    redirect_to root_path, notice: "Your current cart is empty"
  end
end