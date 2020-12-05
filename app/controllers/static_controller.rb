class StaticController < ApplicationController
  def index
      if user_signed_in?
        redirect_to current_user
      end
  end
end
