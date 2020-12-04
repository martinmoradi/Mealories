class Users::UsersController < Users::ApplicationController


  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user =  current_user
    user_params =  params.require(:user).permit(:first_name, :last_name, :email, :objective, :weight_in_kgs, :gender, :age, :height_in_cms, :activity_level)
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
end