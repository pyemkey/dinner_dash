class LineItemsController < ApplicationController

  before_action :set_cart, only: :create

  def index
    @line_items = LineItem.all
  end

  def create
    item = Item.find(params[:item_id])
    @line_item = @cart.add_item(item.id)
    if @line_item.save
      redirect_to @cart, notice: "Item was added successful"
    else
      render :new
    end
  end

  def destroy
    line_item = LineItem.find(params[:id])
    @cart = line_item.cart
    @cart.remove_item(line_item.item.id)
    redirect_to @cart
  end

  private
  def line_item_params
    params.require(:line_item).permit(:item_id)
  end
end