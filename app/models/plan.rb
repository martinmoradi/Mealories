# Schema.rb
# t.bigint "user_id", null: false
#################################

class Plan < ApplicationRecord
  belongs_to :user
  has_many   :days
  has_many   :recipes, through: :days
end
