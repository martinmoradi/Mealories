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
10.times do
  Recipe.create!(
    title:              Faker::Food.dish,
    servings:           Faker::Number.within(range: 1..8),
    prepTime:           Faker::Number.within(range: 10..120),
    cookTime:           Faker::Number.within(range: 20..360),
    steps:              Faker::Food.description,
    ingredientsList:    ingred,
    imageUrl:           Faker::LoremPixel.image(size: "50x60", is_gray: false, category: 'food'),
    author_id:          1,
    totalCal:           Faker::Number.within(range: 100..500),
    totalProt:          Faker::Number.within(range: 10..50),
    totalCarbs:         Faker::Number.within(range: 10..50),
    totalFat:           Faker::Number.within(range: 10..50)
  )
end
  
puts '10 recipes created !'
