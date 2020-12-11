class Admins::RecipesController < Admins::ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    # services / get_nutrients.rb
    begin
    fetched_params = GetNutrients.new(params[:marmiton_url]).perform
    @recipe = Recipe.new(fetched_params)
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_path(@recipe.id) , notice: 'La recette a été crée'}
      else
        format.html { redirect_to new_admins_recipe_path, error: "La recette n'a pas pu être ajoutée."}
      end
    end
  rescue NoMethodError
     redirect_to new_admins_recipe_path, error: 'Recette erronée !!'
  end
  end

  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'La recette a été supprimée.' }
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end
