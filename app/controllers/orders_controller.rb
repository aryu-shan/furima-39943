class OrdersController < ApplicationController
  
  def index
   @item = Item.find(params[:item_id])
   @order = @item.order
   @order_shipping = OrderShipping.new
  end

  def new
    @order_shipping = OrderShipping.new
  end

  def create
       @order_shipping =OrderShipping.new(order_shipping_params)
    if @order_shipping.valid?
      @order_shipping.save(current_user.id, params[:item_id])
       redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_shipping_params
    params.require(:order_shipping).permit(:post_code, :area_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end



