class Users::RecipesController < Users::ApplicationController
  before_action :set_recipe, only: %i[show index]



  def show; end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end
