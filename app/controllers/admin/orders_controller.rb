class Admin::OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end 
    
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total = @order_items.inject(0) { |sum, order_item| sum + order_item.price_intax * order_item.quantity}
  end 
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path
  end 
  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end 
  
end
