class Users::PlansController < Users::ApplicationController
  before_action :set_plan, only: [:update, :destroy, :show]
  before_action :user_profile_incomplete
  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(user_id: current_user.id)
    @plan.save
    params[:plan][:nb_of_days].to_i.times do
      @day = Day.create(plan_id: @plan.id, lunch_id: current_user.generate_lunch.id, dinner_id: current_user.generate_dinner.id)
    end
  end

  def show ; end

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
