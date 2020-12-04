class Users::UsersController < Users::ApplicationController
  before_action :user_profile_incomplete, except: :edit
 
  def show
    @user = User.find(params[:id])
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
end
