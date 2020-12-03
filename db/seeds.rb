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
  first_name:    "La Team",
  last_name:     "Mealories",
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
    prep_time:           Faker::Number.within(range: 10..120),
    cook_time:           Faker::Number.within(range: 20..360),
    steps:              Faker::Food.description,
    ingredients_list:    ingred,
    image_url:           Faker::LoremPixel.image(size: "900x900", is_gray: false, category: 'food'),
    author_id:          1,
    total_cal:           Faker::Number.within(range: 500..2500),
    total_prot:          Faker::Number.within(range: 15..200),
    total_carbs:         Faker::Number.within(range: 15..200),
    total_fat:           Faker::Number.within(range: 15..200)
  )
end
puts '600 recipes created !'

User.create!(
  first_name:     "Toto",
  last_name:      "Tootoo",
  email:         "toto@toto.fr",
  password:      "123456",
  admin:         false,
  objective:     1,
  weight_in_kgs:    90,
  gender:        "Homme",
  height_in_cms:    "180",
  age:           40,
  activity_level: 1
)
puts "Toto has created his account... Yay !"