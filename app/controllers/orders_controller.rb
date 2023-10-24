class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:new, :create]
  before_action :set_item, only: [:index, :new, :create]

  def index
       gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
       @order = @item.order
       @order_shipping = OrderShipping.new
    if @item.order.present? && current_user != @item.user
       redirect_to root_path
      elsif current_user == @item.user
        redirect_to root_path
    end
  end

  def new
    @order_shipping = OrderShipping.new
  end

  def create
       @order_shipping =OrderShipping.new(order_shipping_params)
    if @order_shipping.valid?
      pay_item
       @order_shipping.save
       redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index
    end
  end

  private

    def set_item
    @item = Item.find(params[:item_id])
  end

  def order_shipping_params
    params.require(:order_shipping).permit(:post_code, :area_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end


