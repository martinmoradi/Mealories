class Users::ApplicationController < ApplicationController
  before_action :authenticate_user!
  

  def user_profile_incomplete
    redirect_to edit_user_path(current_user.id) if current_user.incomplete_profile?
  end


end
