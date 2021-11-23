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
    @order = Order.new(order_params) #情報を渡している
  #分岐
    if params[:order][:address] == "1" #address_numberが　”1”　なら下記　ご自身の住所が選ばれたら
      @order.post_code = current_customer.postcode #自身の郵便番号をorderの郵便番号に入れる
      @order.address = current_customer.address #自身の住所をorderの住所に入れる
      @order.receiver = current_customer.last_name+current_customer.first_name #自身の宛名をorderの宛名に入れる

    elsif  params[:order][:address] ==  "2" #address_numberが　”2”　なら下記　登録済からの選択が選ばれたら
      @order.post_code = Shipping.find(params[:order][:address]).postcode #newページで選ばれた配送先住所idから特定して郵便番号の取得代入
      @order.address = Shipping.find(params[:order][:address]).address #newページで選ばれた配送先住所idから特定して住所の取得代入
      @order.name = Shipping.find(params[:order][:address]).receiver #newページで選ばれた配送先住所idから特定して宛名の取得代入

    elsif params[:order][:address] ==  "3" #address_numberが　”3”　なら下記　新しいお届け先が選ばれたら
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
