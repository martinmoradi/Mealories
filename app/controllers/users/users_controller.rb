class Users::UsersController < Users::ApplicationController
  before_action :user_profile_incomplete, only: [:show]
  before_action :authorize_user


  def show
    @user = User.find(params[:id])    
    unless @user.current_plan_id.exist?
      @plan = Plan.find(id: current_user.current_plan_id)
    end     
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    current_user.update(user_params)
    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :objective, :weight_in_kgs, :gender, :age, :height_in_cms, :activity_level)
  end

  def authorize_user
    if current_user != User.find(params[:id])
      redirect_to root_path, alert: "Accès refusé!"
    end
  end
end
