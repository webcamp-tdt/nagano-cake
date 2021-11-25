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
    @order_item = @order.order_items.all
    @order_items = @order.order_items
    @total = @order_items.inject(0) { |sum, order_item| (sum + order_item.item.price * 1.1 * order_item.quantity).round}
   end
   
  def create
    cart_items = current_customer.cart_items.all # ログインユーザーのカートアイテムをすべて取り出して cart_items に入れます
    @order = current_customer.orders.new(order_params) # 渡ってきた値を @order に入れます
      if @order.save# ここに至るまでの間にチェックは済ませていますが、念の為IF文で分岐させています
          cart_items.each do |cart|# 取り出したカートアイテムの数繰り返します
      # order_item にも一緒にデータを保存する必要があるのでここで保存します
          order_item = OrderItem.new
          order_item.item_id = cart.item_id
          order_item.order_id = @order.id
          order_item.quantity = cart.quantity
    # 購入が完了したらカート情報は削除するのでこちらに保存します
          order_item.price_intax = cart.item.price * 1.1
    # カート情報を削除するので item との紐付けが切れる前に保存します
          order_item.save
          end
        redirect_to orders_complete_path
        cart_items.destroy_all
    # ユーザーに関連するカートのデータ(購入したデータ)をすべて削除します(カートを空にする)
      else  @order = Order.new(order_params)
           render :new
      end
  end 
   
  def confirm
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, cart_item| sum + (cart_item.item.price * 1.1).round * cart_item.quantity}
    @totals = @cart_items.inject(0) { |sum, cart_item| sum + (cart_item.item.price * 1.1).round * cart_item.quantity} + 800
    @order = Order.new(order_params) #情報を渡している
  #分岐
    # if params[:order][:payment] == "0"
      # @order.payment = 
    if params[:order][:address_number] == "1" #address_numberが　”1”　なら下記　ご自身の住所が選ばれたら
      @order.post_code = current_customer.postcode #自身の郵便番号をorderの郵便番号に入れる
      @order.address = current_customer.address #自身の住所をorderの住所に入れる
      @order.receiver = current_customer.last_name+current_customer.first_name #自身の宛名をorderの宛名に入れる
    elsif  params[:order][:address_number] ==  "2" #address_numberが　”2”　なら下記　登録済からの選択が選ばれたら
      shipping = Shipping.find(params[:address][:id])
      @order.post_code = shipping.postcode #newページで選ばれた配送先住所idから特定して郵便番号の取得代入
      @order.address = shipping.address #newページで選ばれた配送先住所idから特定して住所の取得代入
      @order.receiver = shipping.receiver #newページで選ばれた配送先住所idから特定して宛名の取得代入
    elsif params[:order][:address_number] ==  "3" #address_numberが　”3”　なら下記　新しいお届け先が選ばれたら
      @shipping = Shipping.new() #変数の初期化
      @shipping.address = params[:order][:address] #newページで新しいお届け先に入力した住所を取得代入
      @shipping.receiver = params[:order][:receiver] #newページで新しいお届け先に入力した宛名を取得代入
      @shipping.postcode = params[:order][:post_code] #newページで新しいお届け先に入力した郵便番号を取得代入
      @shipping.customer_id = current_customer.id #newページで新しいお届け先に入力したmember_idを取得代入
      if @shipping.save #保存
      @order.post_code = @shipping.postcode #上記で代入された郵便番号をorderに代入
      @order.receiver = @shipping.receiver #上記で代入された宛名をorderに代入
      @order.address = @shipping.address #上記で代入された住所をorderに代入
      else
       render 'new'
      end
    end
  end
  
   def complete
   end
  
  private
  
  def order_params
    params.require(:order).permit(:post_code, :address, :receiver, :postage, :payment, :total_payment, :status, :cart_item_id, :shipping_id
    )
  end
  
end 

