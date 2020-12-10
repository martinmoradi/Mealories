class Users::ShoppingListsController < Users::ApplicationController

  def show
    @user = current_user
	  UserMailer.shopping_list_email(@user).deliver_now
    redirect_to user_path(@user.id)
    flash[:notice] = 'Liste de course envoyée'
  end
  
end
