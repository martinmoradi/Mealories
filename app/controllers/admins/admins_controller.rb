class Admins::AdminsController < Admins::ApplicationController

  def show
    @admin = current_user
  end
 
end
