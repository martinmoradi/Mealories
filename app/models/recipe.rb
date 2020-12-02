# Schema.rb
# t.string "title",     null: false
# t.integer "servings", default: 1
# t.integer "prepTime"
# t.integer "cookTime"
# t.text "steps"
# t.text "ingredientsList"
# t.string "imageUrl"
# t.bigint "author_id", default: 1, null: false
# t.decimal "totalCal"
# t.decimal "totalProt"
# t.decimal "totalCarbs"
# t.decimal "totalFat"
# t.string "marmitonUrl"
#############################################

class Recipe < ApplicationRecord

  belongs_to :author,   class_name: "User",   foreign_key: "author_id"
  has_many   :lunchs,   class_name: "Day",    foreign_key: 'lunch_id'
  has_many   :dinners,  class_name: "Day",    foreign_key: "dinner_id"

  def calPerServing
    ((totalCal / servings).to_f).round(2)
  end

  def protPerServing
    ((totalProt / servings).to_f).round(2)
  end

  def fatPerServing
    ((totalFat / servings).to_f).round(2)
  end

  def carbsPerServing
    ((totalCarbs / servings).to_f).round(2)
  end

end
