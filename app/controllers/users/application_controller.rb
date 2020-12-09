class Users::ApplicationController < ApplicationController
  before_action :authenticate_user!
  

  def user_profile_incomplete
    if current_user.incomplete_profile?
      redirect_to edit_user_path(current_user.id)
      flash[:info]="Ton profil n'est pas complet"
    end
  end
end
