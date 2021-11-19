class Customer::OrdersController < ApplicationController
    
  def new 
  end 
  
  def index
    @orders = Order.all
  end 
  
  def show
    @order = Oeder_item.find(params[:id])
    @order = Order.find(params[:id])
  end 
  
  def create
  end 
  
  def confirm
  end 
  
  def complete
  end 
  
end
