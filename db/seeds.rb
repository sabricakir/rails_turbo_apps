# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
100.times do |index|
  #starts_at = index.days.ago
  #ends_at = starts_at + 2*60*60
  #title = Faker::Sport.sport
  #description = Faker::Quote.famous_last_words
  #address = Faker::Address.full_address
  #game = Game.create(starts_at:, ends_at:, title:, description:, address:)
  #User.create(email: Faker::Internet.email)
  #Tag.create(name: Faker::Game.genre)
  #Product.create(name: Faker::Commerce.product_name)
  User.create(email: Faker::Internet.email, password: "password", password_confirmation: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end
#list = List.create!(name: "TODO")
#list.tasks.create!(name: "Buy milk")
#list.tasks.create!(name: "Buy eggs")
#list.tasks.create!(name: "Buy bread")
#list.tasks.create!(name: "Walk the dog")
#list = List.create!(name: "In Progress")
#list = List.create!(name: "Done")