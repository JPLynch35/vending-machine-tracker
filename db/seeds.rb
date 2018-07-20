# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
owner = Owner.create(name: "Sam's Snacks")
dons  = owner.machines.create(location: "Don's Mixed Drinks")
snack1 = dons.snacks.create(name: 'Doritos', price: 150)
snack2 = dons.snacks.create(name: 'Cookies', price: 250)
snack3 = dons.snacks.create(name: 'Peanuts', price: 100)