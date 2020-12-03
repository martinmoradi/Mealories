# Schema.rb
# t.string "title",     null: false
# t.integer "servings", default: 1
# t.integer "prep_time"
# t.integer "cook_time"
# t.text "steps"
# t.text "ingredients_list"
# t.string "image_url"
# t.bigint "author_id", default: 1, null: false
# t.decimal "total_cal"
# t.decimal "total_prot"
# t.decimal "total_carbs"
# t.decimal "total_fat"
# t.string "marmiton_url"
#############################################

class Recipe < ApplicationRecord
  belongs_to :author,   class_name: 'User',   foreign_key: 'author_id'
  has_many   :lunchs,   class_name: 'Day',    foreign_key: 'lunch_id'
  has_many   :dinners,  class_name: 'Day',    foreign_key: 'dinner_id'

  def cal_per_serving
    ((total_cal / servings).to_f).round(2)
  end

  def prot_per_serving
    ((total_prot / servings).to_f).round(2)
  end

  def fat_per_serving
    ((total_fat / servings).to_f).round(2)
  end

  def carbs_per_serving
    ((total_carbs / servings).to_f).round(2)
  end
end
