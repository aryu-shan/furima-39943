class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show,:destroy]
  before_action :set_item, only: [:edit, :update,:show,:destroy]

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
  end

  def edit
    if user_signed_in? && current_user == @item.user
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
       redirect_to item_path(@item)
   else
     render:edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :price, :fee_burden_id, :area_id, :handling_time_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
