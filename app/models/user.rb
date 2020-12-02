# Schema.rb
# t.string "firstName", null: false
# t.string "lastName", null: false
# t.string "email", default: "", null: false
# t.integer "objective"
# t.integer "weightInKg"
# t.string "gender"
# t.integer "heightInCm"
# t.integer "age"
# t.integer "activityLevel"
# t.boolean "admin", default: false
###############################################

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
         # :confirmable (disabled devise confirmation)

  validates_presence_of :firstName, :lastName
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "L'adresse email n'est pas correcte." }

  has_many :recipes, class_name: "Recipe", foreign_key: :author_id, dependent: :nullify
  has_many :plans
  has_many :days, through: :plans

  # Using Mifflin-St-Jeor equation
  def bmr 
    if gender == "Homme" 
      ((10.0 * weightInKg) + (6.25 * heightInCm) - (5 * age) + 5 )
    else 
      ((10.0 * weightInKg) + (6.25 * heightInCm) + (5 * age) - 161 )
    end
  end

  def dailyCal
    case activityLevel
      when 1
        dailyCal = bmr
      when 2
        dailyCal = bmr * 1.375 
      when 3 
        dailyCal = bmr * 1.46 
      when 4
        dailyCal = bmr * 1.725
      when 5
        dailyCal = bmr * 1.9
    end
    if objective == 1 
      dailyCal - ((3500 /2 ) / 7)
    elsif objctive == 2
      dailyCal
    else
      dailyCal + ((3500 / 2) / 7)
    end
    dailyCal
  end

  def dailyProt
    (dailyCal * 0.4) / 4
  end

  def dailyCarbs
    (dailyCal * 0.4) / 4
  end

  def dailyFat 
    (dailyCal * 0.2) / 9
  end

  def activityLevelTitle
  case activityLevel
    when 1
      "Sédentaire"
    when 2
      "Activité sportive une à trois fois par semaine."
    when 3
      "Activité sportive quatre à cinq fois par semaine."
    when 4
      "Activité sportive quotidienne ou séances intenses trois à quatre fois par semaine."
    when 5
      "Activité sportive intense six fois par semaine."
    end
  end

  def objectiveTitle
    case objective
      when 1
        "Garder la ligne"
      when 2
        "Perdre du poids"
      when 3
        "Prendre du poids"
      end
  end


end
