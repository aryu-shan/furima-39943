class FeeBurdensController < ApplicationController
  def index
    @fee_burden = Fee_Burden.order("created_at DESC") #記事一覧が新規投稿順に並ぶように記述
  end

  def new
    @fee_burden = Fee_Burdens.new
  end

  def create
    @fee_burden = Fee_Burdens.new(fee_burden_params)
    if @fee_burden.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def fee_burden_params
    params.require(:fee_burden).permit(:title,:text,:postage_id)
  end
end
