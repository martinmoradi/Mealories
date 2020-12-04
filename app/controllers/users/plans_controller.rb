class Users::PlansController < Users::ApplicationController
  before_action :set_plan, only: %i[update destroy show]
  before_action :user_profile_incomplete
  # before_action :authorize_user, only: %i[update destroy show]

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(user_id: current_user.id)
    respond_to do |format|
      if @plan.save
        params[:plan][:nb_of_days].to_i.times do
          @day = Day.create(plan_id: @plan.id, lunch_id: current_user.generate_lunch.id, dinner_id: current_user.generate_dinner.id)
        end      
        format.html { redirect_to plan_path(@plan.id) }
        format.js {}
      end    
    end
  end

  def show; end

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

  def authorize_user
    if current_user != @plan.user || !current_user.admin 
      redirect_to root_path, alert: "Accès refusé!"
    end
  end

end
