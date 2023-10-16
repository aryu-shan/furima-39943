class CategorysController < ApplicationController
  def index
    @category = Category.order("created_at DESC")
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:title,:text,:genre_id)
  end
end
