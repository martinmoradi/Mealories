class RecipeDayAssigment < ApplicationRecord
  belongs_to :day
  belongs_to :recipe
end
