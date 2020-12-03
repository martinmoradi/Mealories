class Users::UsersController < Users::ApplicationController


  def show
  @user = User.find(params[:id])
  end
  
end