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
  #User.create(email: Faker::Internet.email, password: "password", password_confirmation: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end
#list = List.create!(name: "TODO")
#list.tasks.create!(name: "Buy milk")
#list.tasks.create!(name: "Buy eggs")
#list.tasks.create!(name: "Buy bread")
#list.tasks.create!(name: "Walk the dog")
#list = List.create!(name: "In Progress")
#list = List.create!(name: "Done")
texts = [
  'We🌞',
  "Visiting a historic pizza place in Cannes 🍕 \nTheir home wine is also smooth🍷 #cannes #cotedazur",
  '#regatesroyalesdecannes',
  'Happy 1️⃣ birthday @maltipoo_land 🎂 #maltipoo #cannes #cotedazur',
  'When in Cannes',
  'Last summer in Sounther Italy. Visiting Positano - a tiny town that is really hard to reach unless you travel by sea. It used to be a refuge for la boheme, but a few novels and movie ests turned the place into a wild tourist destination',
  'Visiting a factory where they make stone furniture that lasts ages. An average table costs €6000. Each item is one of a kind unique. This is the kind of things that you buy and pass through many generations…',
  'Shitty life pro tip: You want to make photos on an empty San Marco square? Call the police, say that a bomb has been planted. They will evacuate everyone. Profit! 🤪',
  'That day we woke up at 4 a.m. and met the sunrise in the picturesque bay of Venice',
  '6 months married!',
  'My fluffy friend loves going to work with me',
  'Run forest #run 🏃‍♂️ 🐕 on the coast of #italy #italian',
  'Last summer. Tuskany landscapes look like no other and are easily recognizable due to the trees, hills, and the agriculture',
  'My personal work assistant ❤️',
  'Sarteano - a tiny random city in Tuscany that we decided to stay overnight. It happened to have a fascinating stronghold in the center of #italy',
  "Crossing Italy East to West. Somewhere between Rimini and Rome. The landscapes are so picturesque,  I just can't not smile!",
  'Work from… 🏝️',
  'We love cuddling with @maltipoo_land! 😘',
  'Sittimgnext to the entrance of the Sarteano stronghold. In Ukraine we have just a few remaining castles/strongholds, whereas in Italy there are so so many of them. Why? STONE. A LOT OF STONE ALL AROUND.',
  'In summer I miss winter, in winter I miss summer. But damn, what a beautiful day it is today!',
  'My little girl. I adore her!',
  'It’s a very warm winter - perfect for introducing the puppy to the outside world!',
  '1,2,3,4 CUT 🎬',
  '100,000 km!🤩 #personalrecord #run'
]

texts.each do |text|
  Game.create(title: Faker::Sport.sport, description: text, address: Faker::Address.full_address, starts_at: Time.now, ends_at: Time.now + 2*60*60)
end