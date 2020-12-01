class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_day_assigments 
end
# Schema de la table Recipe

# "title"
# "servings"
# "preptime"
# "cooktime"
# "steps"
# "ingredients"
# "image"
# "author_id"
# "calories"
# "total_daily"
