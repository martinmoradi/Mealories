# Schema.rb
# t.string "first_name", null: false
# t.string "last_name", null: false
# t.string "email", default: "", null: false
# t.integer "objective"
# t.integer "weight_in_kgs"
# t.string "gender"
# t.integer "height_in_cms"
# t.integer "age"
# t.integer "activity_level"
# t.boolean "admin", default: false
###############################################

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # :confirmable (disabled devise confirmation)

  validates_presence_of :first_name, :last_name
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "L'adresse email n'est pas correcte." }
  validates :objective,       presence: true, numericality: true, on: :update
  validates :weight_in_kgs,   presence: true, numericality: true, on: :update
  validates :height_in_cms,   presence: true, numericality: true, on: :update
  validates :age,             presence: true, numericality: true, on: :update
  validates :activity_level,  presence: true, numericality: true, on: :update
  validates :gender,          presence: true, on: :update

  has_one :plan, foreign_key: :current_plan, dependent: :destroy
  has_many :recipes, class_name: 'Recipe', foreign_key: :author_id, dependent: :nullify
  has_many :plans, dependent: :destroy
  has_many :days, through: :plans
  after_create :welcome_mail

  # Using Mifflin-St-Jeor equation
  def bmr
    if gender == 'Homme'
      ((10.0 * weight_in_kgs) + (6.25 * height_in_cms) - (5 * age) + 5)
    else
      ((10.0 * weight_in_kgs) + (6.25 * height_in_cms) + (5 * age) - 161)
    end
  end

  def bmr_activity
    case activity_level
    when 1
      bmr * 1.2
    when 2
      bmr * 1.375
    when 3
      bmr * 1.55
    when 4
      bmr * 1.725
    when 5
      bmr * 1.9
    else
      daily_cal
    end
  end

  def daily_cal
    # loose weight
    daily_cal = if objective == 1
                  bmr_activity - ((3500 / 2) / 7)
                # stay in shape
                elsif objective == 2
                  bmr_activity
                # gain weight
                else
                  bmr_activity + ((3500 / 2) / 7)
                end
    daily_cal.round(2)
  end

  def daily_prot
    (daily_cal * 0.4) / 4
  end

  def daily_carbs
    (daily_cal * 0.4) / 4
  end

  def daily_fat
    (daily_cal * 0.2) / 9
  end

  def activity_level_title
    case activity_level
    when 1
      "Travail sédendaire et ne pratique pas ou peu d'exercice."
    when 2
      'Pratique une activité sportive  1 à 3 fois par semaine.'
    when 3
      'Pratique une activité sportive à effort modéré 3 à 5 fois par semaine.'
    when 4
      'Pratique une activité sportive presque quotidienne.'
    when 5
      'Pratique une activité sportive intense 6 à 7 fois par semaine avec un métier exigeant une activité physique.'
    end
  end

  def activity_level_card
    case activity_level
    when 1
      'Sédentaire'
    when 2
      'Sportif occasionnel'
    when 3
      'Sportif régulier'
    when 4
      'Sportif confirmé'
    when 5
      'Fou de sport'
    end
  end

  def objective_title
    case objective
    when 1
      'Perdre du poids'
    when 2
      'Garder la ligne'
    when 3
      'Prendre du poids'
    end
  end

  def lunch_needs
    {
      cal: ((daily_cal * 40) / 100),
      fat: ((daily_fat * 40) / 100),
      carbs: ((daily_carbs * 40) / 100),
      prot: ((daily_prot * 40) / 100)
    }
  end

  def dinner_needs
    {
      cal: ((daily_cal * 35) / 100),
      fat: ((daily_fat * 35) / 100),
      carbs: ((daily_carbs * 35) / 100),
      prot: ((daily_prot * 35) / 100)
    }
  end

  def generate_lunch
    all_recipes = Recipe.all
    all_recipes.select { |recipe| recipe.cal_per_serving.between?((lunch_needs[:cal] * 90 / 100), (lunch_needs[:cal] * 110 / 100)) }.sample
  end

  def generate_dinner
    all_recipes = Recipe.all
    all_recipes.select { |recipe| recipe.cal_per_serving.between?((dinner_needs[:cal] * 90 / 100), (dinner_needs[:cal] * 110 / 100)) }.sample
  end

  def incomplete_profile?
    [weight_in_kgs, height_in_cms, age].any?(&:zero?)
  end

  # body mass index
  def bmi
    bmi = weight_in_kgs / ((height_in_cms.to_f / 100)**2)
    bmi.round(0)
  rescue ZeroDivisionError
    0
  end

  def bmi_text
    case bmi
    when (1..16.5)
      'Famine'
    when (16.6..18.5)
      'Maigreur'
    when (18.6..25)
      'Corpulence normale'
    when (25.1..30)
      'Surpoids'
    when (30.1..35)
      'Obésité modérée'
    when (35.1..40)
      'Obésité sévère'
    else
      'Obésité morbide'
    end
  end

  private

  def welcome_mail
    UserMailer.welcome_email(self).deliver_now
  end
end
