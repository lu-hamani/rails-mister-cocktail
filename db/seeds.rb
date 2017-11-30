# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Seeding is a go"

Cocktail.destroy_all

Ingredient.destroy_all

cocktail_name = ["Aaron", "Jakob", "Camille", "Julia", "Martine" ]

cocktail_name.each do |name|
  cocktail = Cocktail.new(name: name)
  cocktail.save
  puts "#{cocktail.name} is saved!"
end

ingredient_name = ["nice", "powerful", "sweet", "sour"]

ingredient_name.each do |name|
  ingredient = Ingredient.new(name: name)
  ingredient.save
  puts "#{ingredient.name} is saved!"
end


puts "Seeding finished"
