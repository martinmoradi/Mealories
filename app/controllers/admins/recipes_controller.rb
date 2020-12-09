class Admins::RecipesController < Admins::ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    # services / get_nutrients.rb
    fetched_params = GetNutrients.new(params[:marmiton_url]).perform
    puts fetched_params
    @recipe = Recipe.new(fetched_params)
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to root_path, notice: 'La recette a été crée'}
      else
        format.html { redirect_to root_path, notice: "La recette n'a pas pu être ajoutée."}
      end
    end
  end

  def index
  end
end
