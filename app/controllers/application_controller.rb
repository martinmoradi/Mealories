class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning, :alert
 
  def after_sign_in_path_for(devise)
    user_path(current_user)
  end

end