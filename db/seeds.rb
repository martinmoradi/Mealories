# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'faker'
require 'activerecord-reset-pk-sequence'

ActiveRecord::Base.connection.disable_referential_integrity do
  User.delete_all
  User.reset_pk_sequence
  Recipe.delete_all
  Recipe.reset_pk_sequence
end

User.create!(
  firstName:    "La Team",
  lastName:     "Mealories",
  email:        "mealories@gmail.com",
  password:     "123456",
  admin:        true
)
puts 'Mealories account created !'

ingred = "Poulet, Pomme de terre, Riz, Oignon, Ail, Curcuma "
600.times do
  Recipe.create!(
    title:              Faker::Food.dish,
    servings:           Faker::Number.within(range: 1..4),
    prepTime:           Faker::Number.within(range: 10..120),
    cookTime:           Faker::Number.within(range: 20..360),
    steps:              Faker::Food.description,
    ingredientsList:    ingred,
    imageUrl:           Faker::LoremPixel.image(size: "50x60", is_gray: false, category: 'food'),
    author_id:          1,
    totalCal:           Faker::Number.within(range: 500..2500),
    totalProt:          Faker::Number.within(range: 15..200),
    totalCarbs:         Faker::Number.within(range: 15..200),
    totalFat:           Faker::Number.within(range: 15..200)
  )
end
puts '600 recipes created !'

User.create!(
  firstName:     "Toto",
  lastName:      "Tootoo",
  email:         "toto@toto.fr",
  password:      "123456",
  admin:         false,
  objective:     1,
  weightInKg:    90,
  gender:        "Homme",
  heightInCm:    "180",
  age:           40,
  activityLevel: 1
)
puts "Toto has created his account... Yay !"