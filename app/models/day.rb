# Schema.rb
# t.bigint "lunch_id",  null: false
# t.bigint "dinner_id", null: false
# t.bigint "plan_id",   null: false
###################################

class Day < ApplicationRecord
  belongs_to :lunch, class_name: 'Recipe'
  belongs_to :dinner, class_name: 'Recipe'
  belongs_to :plan
end
