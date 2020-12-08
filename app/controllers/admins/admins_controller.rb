class Admins::AdminsController < Admins::ApplicationController

  def show
    @admin = current_user
    @recipes = Recipe.all
    @users = User.all
  end
 
end
