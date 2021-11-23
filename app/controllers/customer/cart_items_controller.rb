class Customer::CartItemsController < ApplicationController

  def index
    # @cart_items = Cart_item.all

    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = CartItem.new(cart_items_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.update(cart_items_params)
    redirect_to cart_items_path
  end

  def destroy
  end

  def destroy_all
  end

  private
  def cart_items_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end


end
