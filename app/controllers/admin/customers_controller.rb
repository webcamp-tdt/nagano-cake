class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer.id)
      flash[:success] = "プロフィールの変更に成功しました"
    else
      flash[:danger] = "プロフィールの更新に失敗しました"
      render :edit
    end
  end

end
