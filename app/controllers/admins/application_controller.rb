class Admins::ApplicationController < ApplicationController
  before_action :check_if_admin
  
  def check_if_admin
    redirect_to user_path(current_user.id), alert: 'Accès refusé!' if current_user.admin != true
  end
end