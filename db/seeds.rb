# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'activerecord-reset-pk-sequence'

ActiveRecord::Base.connection.disable_referential_integrity do
  User.delete_all
  User.reset_pk_sequence
  Recipe.delete_all
  Recipe.reset_pk_sequence
end

User.create!(
  firstname: "Admin",
  lastname: "Admin",
  email: "lateam@yopmail.com",
  password: "azerty",
  encrypted_password: "azerty",
  admin: true
)

puts 'Admin create'

12.times do
  Recipe.create!(
    title:        Faker::Food.dish,
    servings:     Faker::Number.within(range: 1..8),
    preptime:     Faker::Number.within(range: 10..120),
    cooktime:     Faker::Number.within(range: 20..360),
    steps:        Faker::Food.description,
    ingredients:  "Poulet, Pomme de terre, Riz, Oignon, Ail, Curcuma ",
    image:        Faker::LoremPixel.image(size: "50x60", is_gray: false, category: 'food'),
    user_id:    1,
    calories:     Faker::Number.within(range: 100..500),
    total_daily:  Faker::Number.within(range: 10..50)
  )
end
  
puts '16 recipes create'