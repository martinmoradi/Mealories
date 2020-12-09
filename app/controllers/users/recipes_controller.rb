class Users::RecipesController < Users::ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show; end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes
  # POST /recipes.json
  def create
    # services / get_nutrients.rb
    fetched_params = GetNutrients.new(params[:recipe][:marmiton_url]).perform
    puts fetched_params
    @recipe = Recipe.new(fetched_params)
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to new_admins_recipe_path, notice: 'La recette a été crée'}
      else
        format.html { redirect_to new_admins_recipe_path, error: "La recette n'a pas pu être ajoutée."}
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'La recette a été mise à jour.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'La recette a été supprimée.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  # def recipe_params
  #   params.fetch(:recipe, {})
  # end
end
