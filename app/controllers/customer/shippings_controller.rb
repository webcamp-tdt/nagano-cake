class Customer::ShippingsController < ApplicationController

   def index
    @shippings = Shipping.all
    @shipping_new = Shipping.new
    #@shipping = Shipping.find(params[:id])
   end
   def edit
    @shipping = Shipping.find(params[:id])
   end
   def create
    @shipping = Shipping.new(shipping_params)
    @shipping.customer_id = current_customer.id
    @shipping.save
    redirect_to shippings_path
   end
   def update
    @shipping = Shipping.find(params[:id])
    @shipping.update(shipping_params)
    redirect_to shippings_path
   end
   def destroy
    @shipping = Shipping.find(params[:id])
    @shipping.destroy
    redirect_to shippings_path
   end
  private
  # ストロングパラメータ
  def shipping_params
    params.require(:shipping).permit(:postcode, :address, :receiver)
  end
  
end
