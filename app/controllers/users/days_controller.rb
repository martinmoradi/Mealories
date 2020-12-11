class Users::DaysController < Users::ApplicationController
  before_action :set_day, only: %i[show update destroy]
  
  def show     
    respond_to do |format|
      format.html {} 
      format.js {}
    end
  end

  private

  def set_day
    @day = Day.find(params[:id])
    @plan = Plan.find(params[:plan_id])
  end

end


