class PlansController < ApplicationController
  before_action :set_plan, only: [:update, :destroy]

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)

    respond_to do |format|
      if @plan.save
        format.html 
      else
        format.html 
      end
    end
  end

  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html 
      else
        format.html 
      end
    end
  end

  def destroy
    @plan.destroy
    respond_to do |format|
      format.html 
    end
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.fetch(:plan, {})
  end
end
