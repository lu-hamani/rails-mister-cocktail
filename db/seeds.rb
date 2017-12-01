# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts "Seeding is a go"

Cocktail.destroy_all

Dose.destroy_all

Ingredient.destroy_all

10.times do
  cocktails_url = "http://www.thecocktaildb.com/api/json/v1/1/random.php"
  serialized_cocktails = open(cocktails_url).read
  cocktails_list = JSON.parse(serialized_cocktails)
  cocktail = Cocktail.new(name: cocktails_list["drinks"][0]["strDrink"])
  picture_url = cocktails_list["drinks"][0]["strDrinkThumb"]
  cocktail.photo_url = picture_url
  ingredient = Ingredient.new(name: cocktails_list["drinks"][0]["strIngredient1"])
  puts "ingredient is saved" if ingredient.save
  dose = Dose.new(description: cocktails_list["drinks"][0]["strMeasure1"])
  dose.ingredient = ingredient
  dose.cocktail = cocktail
  puts "dose is saved" if dose.save
  puts cocktails_list["drinks"][0]["strDrink"] + " saved!" if cocktail.save
end

puts "Seeding finished"
