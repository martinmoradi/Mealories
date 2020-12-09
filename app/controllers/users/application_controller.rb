class Users::ApplicationController < ApplicationController
  before_action :authenticate_user!
  add_flash_types :info, :error, :warning

  def user_profile_incomplete
    if current_user.incomplete_profile?
      redirect_to edit_user_path(current_user.id)
      flash[:info] = "Ton profil n'est pas complet"
    end
  end
end
