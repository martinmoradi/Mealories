class Users::ApplicationController < ApplicationController
  before_action :authenticate_user!

  # def check if user profile is complete 
  # end
end