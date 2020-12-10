# Schema.rb
# t.bigint "user_id", null: false
#################################

class Plan < ApplicationRecord
  belongs_to  :user
  has_one     :current_plan, class_name: 'User', foreign_key: 'current_plan_id'
  has_many    :days, dependent: :destroy
  has_many    :recipes, through: :days

  validates :user_id, presence: true

  def diet_type_title
    case diet_type
    when 1
      "Traditionnel"
    when 2
      "Moins de sucres"
    end
  end
end
