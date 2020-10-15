class OrdersController < ApplicationController

  before_action :set_item, only: [:index, :create, :pay_item]

  def index

  end

  def create
    
    @order = ItemOrder.new(order_params) 
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  # def order
  #   redirect_to new_card_path and return unless current_user.card.present?
  # end


  private

  def order_params
    params.permit(:token, :zip_code, :prefecture_id, :city, :adress, :building, :telephone, :item_id).merge(user_id: current_user.id)
    # def item_params
    #   params.require(:item).permit(:user_id, :category_id, :condition_id, :shipping_id, :prefecture_id, :delivery_day_id, :name, :price, :describe, :image ).merge(user_id: current_user.id)
    # end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]# PAY.JPテスト秘密鍵
    customer_token = current_user.card.customer_token
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      customer: customer_token,
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def item_params
    params.require(:item).permit(:user_id, :category_id, :condition_id, :shipping_id, :prefecture_id, :delivery_day_id, :name, :price, :describe, :image ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
