class AreasController < ApplicationController
  def index
    @area = Area.order("created_at DESC") 
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new(area_params)
    if @area.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def area_params
    params.require(:area).permit(:title,:text,:prefecture_id)
  end
end
