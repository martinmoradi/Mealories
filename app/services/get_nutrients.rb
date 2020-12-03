class GetNutrients

  require "recipe_scraper"
  require "google/cloud/translate"
  require "google/cloud/translate/v2"
  require "json"
  require "net/http"
  require "uri"
  require "openssl"

  def initialize(marmiton_url)
    @marmiton_url = marmiton_url
    @recipe_hash = { total_cal: 0.0, total_carbs: 0.0, total_fat: 0.0, total_prot: 0.0 }
  end

  # scrap the recipe from marmiton with recipe_scrapper gem
  def scrap_recipe
    recipe = RecipeScraper::Recipe.new @marmiton_url
    # convert recipe object to hash and merge 
    @recipe_hash.merge!(recipe.to_hash)    
    # rename keys
    @recipe_hash[:servings] = @recipe_hash.delete :nb_of_persons
    @recipe_hash[:prep_time] = @recipe_hash.delete :preptime
    @recipe_hash[:cook_time] = @recipe_hash.delete :cooktime
    @recipe_hash[:image_url] = @recipe_hash.delete :image
    @recipe_hash[:ingredients_list] = @recipe_hash.delete :ingredients
    @recipe_hash[:marmiton_url] = @marmiton_url
    # format strings
    @recipe_hash[:ingredients_list].each { |ingredient| ingredient.gsub!(/\d+/, ' \0 ') }
    @recipe_hash[:title].delete!("\n").strip! 
  
  end

  # translate with google traduction
  def translate_recipe
    @translated_recipe = {}
    # google trad call
    translate = Google::Cloud::Translate::V2.new(
      project_id: ENV['CLOUD_PROJECT_ID:'],
      credentials: ENV['GOOGLE_APPLICATION_CREDENTIALS'],
    )
    translated_ingredients = @recipe_hash[:ingredients_list].map do |ingredient|
      translation = translate.translate ingredient, to: "en"
      translation.text.inspect
    end
    # new hash with translated infos
    @translated_recipe[:ingredients_list] = translated_ingredients.join("\n").gsub! /"/, "|"  
  end

  # post request to Spoonacular API 
  def post_spoonacular
    # %encode ingredients to url 
    encoded_ingr = URI.escape(@translated_recipe[:ingredients_list])   
    # post call block : 
    url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/parseIngredients?includeNutrition=true")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(url)
    request["content-type"] = "application/x-www-form-urlencoded"
    request["x-rapidapi-key"] = ENV['X_RAPIDAPI_KEY']
    request["x-rapidapi-host"] = "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
    # body of the call with ingredients and servings
    request.body = "ingredientList=#{encoded_ingr}&#{@recipe_hash[:servings]}"
    # response 
    response = http.request(request)
  end

  # fetch calories from json response 
  def response_to_macros(response)    
    parsed_json = JSON.pretty_generate(JSON.parse(response.body))
    # this is an array of hashes (nested to infinite T_T)
    recipe_data = JSON.parse(parsed_json)

    # Loop through ingredients
    recipe_data.each do |ingredient|      
      ingr_data = ingredient["nutrition"]

    #   # Loop through nutrition array of hashes
      ingr_data["nutrients"].each do |nutrient| 
        # Sum calories 
        if nutrient["title"] == "Calories" 
          @recipe_hash[:total_cal] +=  nutrient["amount"].to_f
        # Sum proteins
        elsif nutrient["title"] == "Protein"
          @recipe_hash[:total_prot] += nutrient["amount"].to_f
        # Sum carbs
        elsif nutrient["title"] == "Carbohydrates"
          @recipe_hash[:total_carbs] += nutrient["amount"].to_f
        # Sum fat
        elsif nutrient["title"] == "Fat"
          @recipe_hash[:total_fat] += nutrient["amount"].to_f
        end
      end
    end  
  end 
  
  # round to 2 decimals
 def round 
  @recipe_hash[:total_prot] = @recipe_hash[:total_prot].round(2)
  @recipe_hash[:total_cal] = @recipe_hash[:total_cal].round(2)
  @recipe_hash[:total_fat] = @recipe_hash[:total_fat].round(2)
  @recipe_hash[:total_carbs] = @recipe_hash[:total_carbs].round(2)
 end
   
  # yay !
  def perform
    scrap_recipe
    translate_recipe
    response = post_spoonacular
    recipe_macros = response_to_macros(response)
    round 
    @recipe_hash
  end

end 
