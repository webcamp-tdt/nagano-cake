class Customer::OrdersController < ApplicationController
    
  def new 
  end 
  
  def index
    @orders = Order.all
  end 
  
  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items
  end 
  
  def create
  end 
  
  def confirm
  end 
  
  def complete
  end 
  
end
