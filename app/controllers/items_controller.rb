class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(items_params)
    if @items_params.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @items = Item.new
  end

  private
  def item_params
    params.require(:item).permit(:user_id, :category_id, :condition_id, :shipping_id, :prefecture_id, :delivery_day_id, :name, :price, :decribe )
  end


end
