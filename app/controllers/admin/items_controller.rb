class Admin::ItemsController < ApplicationController



  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:image_id, :name, :introduction, :genre_id, :price, :is_active)
  end

end
