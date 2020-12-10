# Schema.rb
# t.bigint "user_id", null: false
#################################

class Plan < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one :current_plan, class_name: "User", foreign_key: "current_plan_id", dependent: :destroy
  has_many :days, dependent: :destroy
  has_many :recipes, through: :days

  validates :user_id, presence: true

  def plan_type
    case type
    when 1
      "Programme normal"
    when 2
      "Programme moins de sucres"
    end
  end
end
