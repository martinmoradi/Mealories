# Schema.rb
# t.string "firstName",          null: false
# t.string "lastName",           null: false
# t.string "email", default: "", null: false
# t.string "encrypted_password", default: "", null: false
# t.string "reset_password_token"
# t.datetime "reset_password_sent_at"
# t.datetime "remember_created_at"
# t.string "objective"
# t.decimal "weightInKg"
# t.string "genre"
# t.integer "heightInCm"
# t.integer "age"
# t.integer "activityLevel"
###############################################

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
         # :confirmable disabled devise confirmation

  validates_presence_of :firstName, :lastName
  validates             :email, uniqueness: true

  has_many :recipes, class_name: "Recipe", foreign_key: :author_id, dependent: :nullify
  has_many :plans
  has_many :days, through: :plans
end
