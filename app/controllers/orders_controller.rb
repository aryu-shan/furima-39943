class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:new, :create]
  before_action :set_item, only: [:index, :new, :create]


  def index
   @order = @item.order
   @order_shipping = OrderShipping.new
    if @item.order.present? && current_user != @item.user
       redirect_to root_path
    end
  end

  def new
    @order_shipping = OrderShipping.new
  end

  def create
       @order_shipping =OrderShipping.new(order_shipping_params)
    if @order_shipping.valid?
      @order_shipping.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

    def set_item
    @item = Item.find(params[:item_id])
  end

  def order_shipping_params
    params.require(:order_shipping).permit(:post_code, :area_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end



