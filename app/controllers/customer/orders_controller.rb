class Customer::OrdersController < ApplicationController
    
   def new
    @order = Order.new
    #@shippings = Shipping.all
    @shippings = current_customer.shippings
   end
   
   def index
    @orders = Order.all
   end
   
   def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items
   end
   
   def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_confirm_path
   end
   
   def confirm
     @
   end
  
   def complete
   end
  
  private
  
  def order_params
    params.require(:order).permit(:post_code, :address, :receiver, :postage, :payment, :total_payment, :status, :cart_item_id, :shipping_id
    )
  end
  
end 