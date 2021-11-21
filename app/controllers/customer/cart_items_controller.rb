class Customer::CartItemsController < ApplicationController

  def index
  end

  def create
    @cart_item = Cartitem.new(cart_items_params)
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end


end
