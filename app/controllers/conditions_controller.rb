class ConditionsController < ApplicationController

  class CategorysController < ApplicationController
    def index
      @condition = Condition.order("created_at DESC") 
    end
  
    def new
      @condition = Condition.new
    end
  
    def create
      @condition = Condition.new(condition_params)
      if @condition.save
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def condition_params
      params.require(:condition).permit(:title,:text,:usage_id)
    end
  end
  