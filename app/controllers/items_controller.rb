class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item= Item.new(item_params)
    if @item.save
      redirect_to root_path # 保存成功時のリダイレクト先を設定する（
    else
      render :new # 保存失敗時は新規作成ページを再表示する
    end
  end

  def item_params
    params.require(:item).permit(:name,:explanation,:category_id,:condition_id,:price,:fee_burden_id,:area_id,:handling_time_id,:image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end

