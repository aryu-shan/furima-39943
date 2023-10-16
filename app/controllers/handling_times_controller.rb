class HandlingTimesController < ApplicationController
  def index
    @handling_time = Category.order("created_at DESC") 
  end

  def new
    @handling_time = Handling_Time.new
  end

  def create
    @handling_time = Handling_Time.new(handling_time_params)
    if @handling_time.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def handling_time_params
    params.require(:handling_time).permit(:title,:text,:genre_id)
  end
end