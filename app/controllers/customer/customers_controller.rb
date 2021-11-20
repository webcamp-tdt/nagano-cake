class Customer::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_mypage_path
  end

  def check
    @customer = current_customer
    #ユーザーの情報を見つける
  end

  def withdraw
    @customer = current_customer
    #現在ログインしているユーザーを@userに格納
    @customer.update(is_deleted: "退会")
    #updateで登録情報をInvalidに変更
    redirect_to root_path
    #指定されたrootへのpath
  end

  private


  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email)
  end

end
