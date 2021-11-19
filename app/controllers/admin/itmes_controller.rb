class Admin::ItmesController < ApplicationController

  def new
  end

  def index
  end

  def show
    @items = Items.find(params[:id])
  end

  def edit
  end

  def create
  end

  def update
  end



end
