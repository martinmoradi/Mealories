class Users::PlansController < Users::ApplicationController
  before_action :set_plan, only: %i[update destroy show]
  before_action :user_profile_incomplete, only: %i[create show edit update destroy]
  before_action :authorize_plan, only: %i[update destroy show]
  
  def new
    @plan = Plan.new
  end

  def index
    @plans = Plan.where(user_id: current_user.id)
  end

  def create
    respond_to do |format|
      @plan = Plan.new(user_id: current_user.id)
      if @plan.save
        params[:plan][:nb_of_days].to_i.times do
          @day = Day.create(plan_id: @plan.id, lunch_id: current_user.generate_lunch.id, dinner_id: current_user.generate_dinner.id)
        end
        format.html {redirect_to plan_path(@plan)}
        format.js   {}
      end
    end
  end

  def show
    @days = @plan.days
    respond_to do |format|
      format.html do
        # code html
      end

      format.js do
        # code js
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
      format.html { redirect_to plans_path, alert: "Plan supprimé" }
      format.js { flash[:notice] = "Plan supprimé"}
    end
    
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.fetch(:plan, {})
  end

  def authorize_plan
    redirect_to root_path, alert: 'Accès refusé!' if current_user != @plan.user
  end
end
