class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items= Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item= Item.new(item_params)
    if @item.save
      redirect_to root_path 
    else
      render :new 
    end
  end

  def show
    @item =Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if user_signed_in? && current_user == @item.user
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    redirect_to item_path(@item)
  else
     render:edit
   end
end



  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :price, :fee_burden_id, :area_id, :handling_time_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
