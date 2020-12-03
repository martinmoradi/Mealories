module RecipeToNutrients

  class GetNutrients

    require "recipe_scraper"
    require "google/cloud/translate"
    require "json"
    require "net/http"
    require "uri"
    require "openssl"

    def initialize
      @recipe = recipe
    end

    # scrap the recipe from marmiton with recipe_scrapper gem 
    def scrap_recipe(recipe)
      recipe = RecipeScraper::Recipe.new recipe.marmitonUrl
      # convert recipe object to hash
      recipe_hash = recipe.to_hash
      # rename key 
      recipe_hash[:servings] = recipe_hash.delete :nb_of_persons
      # format string (add spaces)
      recipe_hash[:ingredients].each { |ingredient| ingredient.gsub!(/\d+/, ' \0 ') }     
      recipe_hash
    end

    # translate with google traduction 
    def translate_recipe(recipe_hash)   
      translated_ingredients = []
      translated_recipe = {}
      # google trad call 
      # TO DO : FIND A WAY TO EXPORT ENVIRONMENT VARIABLE -- COMMMAND LINE = export GOOGLE_APPLICATION_CREDENTIALS = "[PATH]" (crediential_json.json)
      translate = Google::Cloud::Translate.translation_v2_service project_id: ENV["CLOUD_PROJECT_ID"]
        recipe_hash[:ingredients].each do |ingredient|
        translation = translate.translate ingredient, to: "en"
        translated_ingredients << translation.text.inspect
      end
      # new hash with translated infos
      translated_recipe[:ingredients_list] = translated_ingredients.join("\n").gsub! /"/, "|"
      translated_recipe[:servings] = recipe_hash[:servings]
      translated_recipe
    end

    # post request to Spoonacular API 
    def post_spoonacular(translated_recipe)
      # %encode ingredients to url
      encoded_ingr = URI.escape(translated_recipe[:ingredients_list])
      # post call block : 
      url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/parseIngredients?includeNutrition=true")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(url)
      request["content-type"] = "application/x-www-form-urlencoded"
      # TO DO = FIND A WAY TO HIDE THIS API KEY ENV NOT WORKING 
      # request["x-rapidapi-key"] = ENV['x_rapidapi_key']
      request["x-rapidapi-key"] = ENV["x_rapidapi_key"]
      request["x-rapidapi-host"] = "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
      # content of the call
      request.body = "ingredientList=#{encoded_ingr}&#{translated_recipe[:servings]}"
      # response 
      response = http.request(request)
    end

    # fetch calories from json response 
    def response_to_macros(response) 
      recipe_macros = { sum_calories: 0.0, sum_proteins: 0.0, sum_carbs: 0.0, sum_fat: 0.0 }
      parsed_json = JSON.pretty_generate(JSON.parse(response.body))
      # THIS IS AN ARRAY OF HASHES (nested to infinite)
      recipe_data = JSON.parse(parsed_json)

      # Loop through ingredients
      recipe_data.each do |ingredient|      
        ingr_data = ingredient["nutrition"]

      #   # Loop through nutrition array of hashes
        ingr_data["nutrients"].each do |nutrient| 
          # Sum calories 
          if nutrient["title"] == "Calories" 
            recipe_macros[:sum_calories] +=  nutrient["amount"].to_f
          # Sum proteins
          elsif nutrient["title"] == "Protein"
            recipe_macros[:sum_proteins] += nutrient["amount"].to_f
          # Sum carbs
          elsif nutrient["title"] == "Carbohydrates"
            recipe_macros[:sum_carbs] += nutrient["amount"].to_f
          # Sum fat
          elsif nutrient["title"] == "Fat"
            recipe_macros[:sum_fat] += nutrient["amount"].to_f
          end
        end
      end    
      # round results
      recipe_macros.each { |k,v| recipe_macros[k] = v.round(2) }
    end 
    
    def perform(recipe)
      recipe_hash = recipe_scrapper(recipe)
      translated_recipe = translate_recipe(recipe_hash)
      response = post_spoonacular(translated_recipe)
      recipe_macros = response_to_macros(response)
      puts "Dans ce plat pour #{recipe_hash[:servings]} personnes, il y a #{recipe_macros[:sum_calories]} calories, #{recipe_macros[:sum_proteins]}g de protéines, #{recipe_macros[:sum_carbs]}g de sucres et #{recipe_macros[:sum_fat]}g de gras."
    end

  end 
end